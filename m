Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SDEel-00089G-HT
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 14:40:47 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 7A60EF8121B; Thu, 29 Mar 2012 06:31:45 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 91A53F811ED;
	Thu, 29 Mar 2012 06:31:43 -0600 (MDT)
Message-ID: <4F74562F.1040306@mlbassoc.com>
Date: Thu, 29 Mar 2012 06:31:43 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1333018650-987-1-git-send-email-gary@mlbassoc.com>
	<4F7449C6.8090004@opendreambox.org> <4F744BD1.1070309@mlbassoc.com>
	<4F744D81.1090202@opendreambox.org>
In-Reply-To: <4F744D81.1090202@opendreambox.org>
Subject: Re: [meta-oe 1/2] python-twisted: update to latest upstream version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 12:40:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-29 05:54, Andreas Oberritter wrote:
> On 29.03.2012 13:47, Gary Thomas wrote:
>> On 2012-03-29 05:38, Andreas Oberritter wrote:
>>> Hi Gary,
>>>
>>> I was going to submit a similar patch. See my comments inline.
>>
>> Feel free to submit yours - I have no investment in my version, it was
>> purely
>> an update of the one in the current repo with a couple of tweaks.
>
> I held it back, because I haven't decided yet what to do with the
> unpackaged files:
>
> WARNING: For recipe python-twisted, the following files/directories were installed but not shipped in any package:
> WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info
> WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/top_level.txt
> WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/requires.txt
> WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/SOURCES.txt
> WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/PKG-INFO
> WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/dependency_links.txt
> WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/not-zip-safe
> WARNING:   /usr/lib/python2.7/site-packages/twisted/topfiles
> WARNING:   /usr/lib/python2.7/site-packages/twisted/topfiles/README
> WARNING:   /usr/lib/python2.7/site-packages/twisted/topfiles/NEWS
> WARNING:   /usr/lib/python2.7/site-packages/twisted/topfiles/CREDITS
> WARNING:   /usr/lib/python2.7/site-packages/twisted/topfiles/ChangeLog.Old
> WARNING:   /usr/lib/python2.7/site-packages/twisted/python/_initgroups.c
> WARNING:   /usr/lib/python2.7/site-packages/twisted/python/twisted-completion.zsh
> WARNING:   /usr/lib/python2.7/site-packages/twisted/python/_epoll.c

I see these as well - I'm not sure if it's useful to package them as they
are just [human readable] information...  Not terribly important on _my_
embedded platform :-)

>
> I also wonder why _initgroups.c and _epoll.c don't get deleted by the command
> in do_install_append(). Did you observe the same behaviour?

Looks like at least a typo and something strange with the quoting?  I just tried this:

diff --git a/packages/python/python-twisted_12.0.0.bb b/packages/python/python-twisted_12.0.0.bb
index a642656..536296f 100644
--- a/packages/python/python-twisted_12.0.0.bb
+++ b/packages/python/python-twisted_12.0.0.bb
@@ -18,7 +18,8 @@ inherit setuptools

  do_install_append() {
      # remove some useless files before packaging
-    find ${D} -name "*.bat" -o -name "*.c" -o -name "*.h" -exec rm {} \;
+    find ${D} -name "*.bat" -o -name "*.c" -o -name "*.h" -print -exec rm \{} \;
+    find ${D} -name "*.bat" -o -name "*.c" -o -name "*.h" | xargs -t rm
  }

The first command (which I think needs the \{} instead of {} - at least that's how
I've always seen it used) only finds a single .h file.  The second version works
properly (and is "cheaper" since all the files are deleted at once)

>
>> BTW, I couldn't figure out how to get 'git' to recognize this as a rename
>> with changes when I commited the change.  Any hints?
>
> It depends on the percentage of changed lines. See the --find-renames option
> of git-diff(1).

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


