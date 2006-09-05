Received: from [81.255.54.11] (helo=mx.laposte.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <c.romain@laposte.net>) id 1GKciD-0003fi-C2
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Sep 2006 17:19:41 +0200
Received: from [192.168.2.2] (86.201.191.245) by mx.laposte.net (7.2.060.1)
	(authenticated as c.romain)
	id 44F4DDCE004EA137; Tue, 5 Sep 2006 17:16:20 +0200
Message-ID: <44FD86BF.2070200@laposte.net>
Date: Tue, 05 Sep 2006 16:16:31 +0200
From: cyril Romain <c.romain@laposte.net>
User-Agent: Mail/News 1.5 (X11/20060114)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <E1GKCrb-0005hO-P4@linuxtogo.org>	<1157373682.16945.61.camel@gandalf.tm.informatik.uni-frankfurt.de>	<44FC28C6.5040800@dominion.kabel.utwente.nl>	<1157377129.16945.80.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<44FC2E10.2020807@dominion.kabel.utwente.nl>
In-Reply-To: <44FC2E10.2020807@dominion.kabel.utwente.nl>
X-Mailman-Approved-At: Tue, 05 Sep 2006 17:41:32 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.8
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: Improving consistency
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
X-List-Received-Date: Tue, 05 Sep 2006 15:19:42 -0000
Content-Type: multipart/mixed; boundary="------------070308080703010500040102"

--------------070308080703010500040102
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
>>> Is it possible to have a 'bitbake sanitize <provider>' command that will output a
>>> sanitized .bb? It doesn't have to be perfect, but some aid in this tedious task would be
>>> helpfull.
>>>       
>> That depends. I have been thinking about this for quite some time,
>> because
>> I really would like to have such a thing. We already have a bit of the
>> infrastructure
>> in place, but the one thing missing is that once the metadata is parsed,
>> we lose
>> a) order and b) source statements (pointers to a .bb or even better the
>> textual entity
>> that was the source for a certain statement).
>>     
>
> What about a simple script that sorts DESCRIPTION, LICENSE, do_install(), etc? That would
> make an excellent addition to the contrib/ dir in the repo.
>   

Ok.
In attachment is a first attempt for such a script. It is a 
quick-and-dirty written script that don't write any file yet. It only 
dumps the sanitized file into the console.
Since Python does not have ordered dictionary, I used this one (also in 
attachment): http://www.voidspace.org.uk/python/odict.html

To test it:
./sanitize.py yourBitbakeFile.bb

To create a sanitized file and a patch e.g. for gcc_4.1.1.bb:
./sanitize.py gcc_4.1.1.bb > gcc_4.1.1.bb.sanitized; diff -u 
gcc_4.1.1.bb  gcc_4.1.1.bb.sanitized > gcc_4.1.1.bb.patch

There is still many things to do, but if you find it useful I can 
improve and finalize it.
As you will see, the script dumps warnings on unknown variables, i.e. 
the variables that are used in .bb file that are not listed in the Style 
Guidelines.
Can anyone please update the Style Guidelines with the complete list of 
variables ?
Hum... maybe I'd rather using the script to grep for all the unknown 
variables and add them to the wiki, so that you (Mickey or anyone else) 
can sort them.

I suggest to add in the Style Guidelines a rule that recommend to put 
comments into do_ routines or into VARIABLE="... " sections, otherwise 
it is tricky or even not possible to correctly handle comments.

I don't know how bitbake internally handles data from a .bb file, but 
maybe it is better to handle the sanitization from bitbake, especially 
because bitbake knows how to read (and therefore to write) a .bb file. 
Any thought on that ?

Feel free to answer for any requests, bugs or suggestions.

Best regards,

  Cyril



--------------070308080703010500040102--
