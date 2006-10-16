Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1GZaBr-0007is-6x
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Oct 2006 23:40:07 +0200
Received: from [88.134.98.23] (helo=[192.168.1.103])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <freyther@inf.fu-berlin.de>)
	id 1GZa5H-0006Vl-Bk; Mon, 16 Oct 2006 23:33:19 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
X-Gpgmail-State: !signed
Message-Id: <E94509B5-D500-4838-A900-72815CB93ADE@inf.fu-berlin.de>
From: Holger Freyther <freyther@inf.fu-berlin.de>
Date: Mon, 16 Oct 2006 23:31:34 +0200
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 88.134.98.23
Cc: monotone-devel@nongnu.org, openembedded-core@lists.openembedded.org
Subject: [ANN] Bonsai like service available - source included, batteries not
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Oct 2006 21:40:07 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit

Hey,

I proudly present my first web application ever.

It is currently called: tinderboxserver/bonsai

What is it?
    Currently it indexes SVN and MTN SCM trees and provides a way to  
monitor and query these trees and provides RSS feeds for your queries.

Why?
    The primary use-case is to have something like the Attic from  
CVS. Using a query you will easily find files you have deleted or  
moved away. This is a feature I have missed in both subversion and  
monotone.
Also I need to write a tinderbox which will be sane and not use perl.  
So I wanted to play with python and python frameworks

How?
    I have decided to use python2.4 as this is my favorite scripting  
language. I have not evaluated ruby at this point as this started as  
one of my many weekend projects which I never publish. I have decided  
to use Django from the www.djangoproject.org as this allows me to  
easily abstract from the database implementations. All I had to do  
was define a model for my Bonsai and call manage.py syncdb to  
actually create the database. There is one script to add SCM systems  
to the Bonsai and another one to update it.

How to use it?
    Currently a flat browse of SCMs is supported, queries for files,  
authors and descriptions. Querying diffs is on the todolist.

    http://www.openembedded.org/bonsai/view/scms - This will show you  
all tracked SCM systems
    http://www.openembedded.org/bonsai/query/author/njs/ - This willl  
search for CSets by njs
    http://www.openembedded.org/bonsai/query/author/njs@pobox.com/? 
exact=1 will match exactly
    http://www.openembedded.org/bonsai/query/file/ChangeLog/?exact=1  
will search for the ChangeLog
    http://www.openembedded.org/bonsai/query/description/zecke/ will  
sarch for a log message containing this word

    from the Query Pages you can easily get to the RSS feed.  
Alternatively go to http:/www.openembedded.org/bonsai/feeds/author/ 
njs@pobox.com/ and you get an RSS feed, Atoms will also be easy to  
implement.

  And everything is cross referenced, but a nice and sane query input  
and sorting is missing.

Common options:
    items=XX number of items, but don't DOS the box ;)
    scm_id=XX filter to a specific tree. YOu get the tree ID by using  
view/scms and taking a look at the ID
    exact=1 will use = instead of like on the db query


    author=XX will filter on the author


Where to get it?
     The license is MIT (if this somehow applys to scripting  
labguages) and it can be found at http://www.openembedded.org/dl/ 
tinderbox-server.tar.bz2 , http://code.djangoproject.com/ticket/2912


Requirements?
     It uses python2.4, pysvn for SVN indexing and obviously django 
+patch (for the RSS generation)


Future?
    Comments, ideas, patches, sane templates, donations, getting  
stuff send from my amazone wishlist (yes woglinde, I'm evil, I even  
have a payback card!)

   Seriously I will improve the python code, implement a sane query  
page, will allow further filtering and sorting of the results and  
will implement my tinderbox/dashboard using Django as well. If  
someone feels contributing more than one single patch, or a better  
template  I will use mtn to allow people to contribute.


kind regards, rock and peace
    zaed

PS: I will be happy to assist you to setup a bonsai as well


