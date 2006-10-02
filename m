Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GUOMP-0003pd-5b
	for openembedded-devel@openembedded.org; Mon, 02 Oct 2006 16:01:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k92DtLDk027799;
	Mon, 2 Oct 2006 14:55:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27743-01; Mon,  2 Oct 2006 14:55:19 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k92DtHW7027781
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 2 Oct 2006 14:55:18 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <192578441.20061002160011@gmail.com>
References: <1159280896.5573.123.camel@localhost.localdomain>
	<192578441.20061002160011@gmail.com>
Date: Mon, 02 Oct 2006 14:55:18 +0100
Message-Id: <1159797318.5744.38.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>, bitbake-dev@lists.berlios.de
Subject: Re: Bitbake past, present and future [long]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2006 14:01:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Paul,

On Mon, 2006-10-02 at 16:00 +0300, Paul Sokolovsky wrote:
>   Richard, thanks for this comprehensive discussion. Before rushing
> with (stupid) questions, I decided to (re)read bitbake-dev and other
> archives to have clearer picture myself. I've captured what I found at
> http://www.openembedded.org/bitbakebackground (linked from OE's wiki
> frontpage).

That's helpful, thanks. We do need to work on the documentation but a
set of links like that will be useful for others.

Its also interesting to see how things have changed!

>   With this overall picture in mind, the changes in bitbake over last
> year (most of which were led by you) are indeed big and highly
> improving, and it's IMHO clear that they should be continued, until
> BitBake and OE metatada would indeed scale well in both perfomance and
> maintenance.

That is the aim :)

>   I still don't have general understanding of BitBake internal
> functioning, but I guess, the best thing I can do is find answer to my
> specific questions myself in the code.

If you have some specific questions, do feel free to ask them. Someone
should be able to at least point you at the code in question. I've been
working to try and modularise the bitbake code base so you shouldn't hit
quite as steep a learning curve as there once was.

>   But I have to questions of general nature:
> 
> 1. What is status of bitbake-ng?
> 
> IIRC, once info about it was in OE wiki. But now searching for it
> returns only that it is scheduled topic for OEDEM. So, I guess,
> exact answers will be known after it, and so far it's in "postponed"
> state. Well, I cannot say that I personally regret aboy this - it's
> possible to implement non-so-scalable patterns (or antipatterns) in C
> as well, but C brings segfaults and higher steep hacking curve with
> it. Python seems like very perfect language for the tool like BitBake.

What I said a year ago basically still stands as far as I'm concerned.
Back then I didn't understand the bitbake internals and said I'd need to
learn them first. Having learnt a lot about them, modified them and
tried to tune them for performance, I still think we're better off
moving the current code base forwards rather than starting again on a C
based -ng version. I think python does lend itself to what we're doing.

Having said that, I can see certain bits of bitbake being rewritten in
C, particularly the parser and the data modules.

We also totally lack a set of developers to write bitbake-ng anyway,
even if I did think it was a good idea.

> 2. Using structured secondary storage (i.e. SQL db) as datastore
> 
> No surprise, I wasn't the first to consider sqlite for the backend ;-)
> - Holger tried that long ago,
> https://lists.berlios.de/pipermail/bitbake-dev/2005-May/000018.html
> 
> So, my question would be: after all the refactors BitBake undergone
> since that, would sqlite backend be more feasible?
>
> But again, I understand, the answer will likely be: "try and see".

In short, no, and I don't think sqlite is ever going to work without a
different kind of major re-factoring. 

I was once of the "sqlite will solve all our problems" opinion but you
need to understand the way bitbake uses its data. The data module gets
*hammered*. I mean really **hammered**. It sees hundreds of thousands of
variable lookups and expansions. Put SQL in there and you slow down
bitbake by orders of magnitude as python dictionaries are faster.

Even if we can change the parser and the way bitbake uses variables to
avoid this hammering, it doesn't change the fact that a python
dictionary will be faster. The only other consideration is memory usage
but we basically have that under control now. As we constrain our usage
of python dictionaries in the data class, it may be possible a specially
designed python class might be faster, or that a C based solution could
be faster but these are things someone needs to experiment with. I
briefly tried both and didn't have much success.

Also, recently, I tried using sqlite for taskdata/runqueue. When I
ripped it out and used python dictonaries, I got a 5 times speed
increase. Every time I've tried to use sqlite, I've been
disappointed :-(.

I can give some results of some profiling I did recently. bitbake spends
a lot of time in the expand function in data.py. All variables are
expanded when looked up and this is a time consuming activity. zecke has
worked wonders on that with certain caches to speed up lookups but it
still remains our biggest bottleneck.

485160/276302   11.060   0.000   79.150    0.000 lib/bb/data_smart.py:53(expand)
96791/46888     10.390   0.000   54.620    0.001 :0(eval)
   470029       7.120    0.000   18.160    0.000 lib/bb/data_smart.py:170(getVarFlag)
295446/37522    7.040    0.000   72.230    0.002 :0(sub)
409472/70517    6.080    0.000   68.260    0.001 lib/bb/data_smart.py:155(getVar)
287386/155778   5.720    0.000   55.710    0.000 lib/bb/data_smart.py:54(var_sub)
   324100       5.300    0.000    8.340    0.000 /usr/lib/python2.4/copy.py:75(copy)
   627840       4.210    0.000    4.210    0.000 :0(find)
   217970       3.590    0.000    5.680    0.000 /usr/lib/python2.4/posixpath.py:56(join)
   502765       3.270    0.000    3.270    0.000 lib/bb/data_smart.py:95(_findVar)
96791/46888     3.230    0.000   56.750    0.001 lib/bb/data_smart.py:65(python_sub)
   513155       2.620    0.000    2.620    0.000 :0(group)
     3221       2.170    0.001   33.110    0.010 <bb>:1(base_set_filespath)
   357710       1.900    0.000    1.900    0.000 :0(get)
96791/46888     1.810    0.000   49.160    0.001 <string>:0(?)
    60034       1.760    0.000    3.410    0.000 lib/bb/COW.py:82(__getitem__)
36388/10786     1.350    0.000    6.880    0.001 lib/bb/parse/parse_py/BBHandler.py:199(feeder)
    66398       1.330    0.000    1.330    0.000 :0(stat)
    65874       1.330    0.000    2.640    0.000 /usr/lib/python2.4/posixpath.py:168(exists)
     2102       1.230    0.001    5.520    0.003 lib/bb/__init__.py:349(which)
   218019       1.150    0.000    1.150    0.000 :0(endswith)
    85356       1.070    0.000    1.070    0.000 :0(match)
   188910       1.040    0.000    1.040    0.000 :0(append)
120707/64380    1.080    0.000   52.940    0.001 lib/bb/data.py:89(getVar)

Its obvious that the data implementation or more productively, the usage
of the data implementation can be improved. Other interesting areas are:

usr/lib/python2.4/posixpath.py:56(join) - can we avoid some of these?
<bb>:1(base_set_filespath) - this is a horrible function and I'm sure we
could do better, maybe with a total rewrite and/or rethink
/usr/lib/python2.4/posixpath.py:168(exists) - add an internal function +
cache for this (combine with a centralised mtime cache?).

Now, if only I could get call graphing working properly... :)

>     So, I'm going to understand internal datastructures of BitBake
> better first. And in the meantime, work on some trivial/small (thanks
> to Python!) tweaks/improvements. One thing I want to grasp first is
> unittesting of BitBake. Again, I'm glad there's bitbake-tests
> directory in BB trunk already.

Sounds good. zecke is the QA expert and the one to ask about the tests.

Cheers,

Richard



