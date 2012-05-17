Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SV2ei-00008Y-0U
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 17:30:21 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 29FB4F81240; Thu, 17 May 2012 09:20:12 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	MANY_SUBDOM autolearn=no version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id BEE83F81242;
	Thu, 17 May 2012 09:19:48 -0600 (MDT)
Message-ID: <4FB51714.8030201@mlbassoc.com>
Date: Thu, 17 May 2012 09:19:48 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4FB508C7.4070808@mlbassoc.com> <3003401.DA8hFehsbE@helios>
	<4FB50F30.7000906@mlbassoc.com> <2161931.GEEF89rDH1@helios>
In-Reply-To: <2161931.GEEF89rDH1@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-browser
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
X-List-Received-Date: Thu, 17 May 2012 15:30:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012-05-17 09:04, Paul Eggleton wrote:
> On Thursday 17 May 2012 08:46:08 you wrote:
>> On 2012-05-17 08:37, Paul Eggleton wrote:
>>> On Thursday 17 May 2012 08:18:47 Gary Thomas wrote:
>>>> Trying the new layer, when I ran 'bitbake chromium -c fetch', I got =
this
>>>> error: Fetcher failure for URL:
>>>> 'http://commondatastorage.googleapis.com/chromium-browser-official/c=
hromi
>>>> um
>>>> -19.0.1049.3.tar.bz2'. The fetch command returned success for url
>>>> http://commondatastorage.googleapis.com/chromium-browser-official/ch=
romiu
>>>> m-
>>>> 19.0.1049.3.tar.bz2 but
>>>> /local/p60_poky/downloads/chromium-19.0.1049.3.tar.bz2 doesn't exist=
?!
>>>>
>>>> Looking at my tree, I found this:
>>>>
>>>> downloads/chromium-19.0.1049.3.tar.bz2?cms_redirect=3Dyes&redirect_c=
ounter=3D
>>>> 1
>>>> which has MD5SUM that matches the recipe.
>>>>
>>>> Any ideas what might have gone wrong?
>>>
>>> If it really has "?cms_redirect=3Dyes&redirect_counter=3D1" at the en=
d of the
>>> filename that might have something to do with it...
>>
>> Of course, but that's a result of the fetcher code - the recipe does n=
ot
>> have such:
>>     SRC_URI =3D
>> "http://commondatastorage.googleapis.com/chromium-browser-official/${P=
}.tar
>> .bz2"
>>
>> The fetch log is at http://www.mlbassoc.com/misc/chromium_fetch.log
>> My build host is Fedora 16 (i686)
>> My oe-core (poky/master) is rev 38da655788
>
> Out of curiosity I tried to download the file manually and got a 404, s=
o I
> think there is a bigger issue with this recipe than fetcher behaviour..=
.

Interesting because the fetcher did get the file for me, albeit with thos=
e
decorations, that has the correct MD5SUM
   -rw-rw-r-- 1 gthomas gthomas 176721817 Feb 23 14:57 downloads/chromium=
-19.0.1049.3.tar.bz2
(I stripped the decorations manually)

It does look like there's a lot of redirecting going on which is causing =
the
wget behaviour:

$ wget http://commondatastorage.googleapis.com/chromium-browser-official/=
chromium-19.0.1049.3.tar.bz2
--2012-05-17 09:16:00--  http://commondatastorage.googleapis.com/chromium=
-browser-official/chromium-19.0.1049.3.tar.bz2
Resolving commondatastorage.googleapis.com... 74.125.225.76, 74.125.225.7=
4, 74.125.225.75
Connecting to commondatastorage.googleapis.com|74.125.225.76|:80... conne=
cted.
HTTP request sent, awaiting response... 302 Found
Location: http://redirector-bigcache.googleapis.com/chromium-browser-offi=
cial/chromium-19.0.1049.3.tar.bz2 [following]
--2012-05-17 09:16:01--  http://redirector-bigcache.googleapis.com/chromi=
um-browser-official/chromium-19.0.1049.3.tar.bz2
Resolving redirector-bigcache.googleapis.com... 209.85.225.95
Connecting to redirector-bigcache.googleapis.com|209.85.225.95|:80... con=
nected.
HTTP request sent, awaiting response... 302 Found
Location: http://o-o.preferred.atl14s01.v2.lscache4.c.bigcache.googleapis=
.com/chromium-browser-official/chromium-19.0.1049.3.tar.bz2?cms_redirect=3D=
yes [following]
--2012-05-17 09:16:02--  http://o-o.preferred.atl14s01.v2.lscache4.c.bigc=
ache.googleapis.com/chromium-browser-official/chromium-19.0.1049.3.tar.bz=
2?cms_redirect=3Dyes
Resolving o-o.preferred.atl14s01.v2.lscache4.c.bigcache.googleapis.com...=
 173.194.11.234
Connecting to o-o.preferred.atl14s01.v2.lscache4.c.bigcache.googleapis.co=
m|173.194.11.234|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://v2.cache2.c.bigcache.googleapis.com/chromium-browser-off=
icial/chromium-19.0.1049.3.tar.bz2?cms_redirect=3Dyes&redirect_counter=3D=
1 [following]
--2012-05-17 09:16:03--  http://v2.cache2.c.bigcache.googleapis.com/chrom=
ium-browser-official/chromium-19.0.1049.3.tar.bz2?cms_redirect=3Dyes&redi=
rect_counter=3D1
Resolving v2.cache2.c.bigcache.googleapis.com... 74.125.212.49
Connecting to v2.cache2.c.bigcache.googleapis.com|74.125.212.49|:80... co=
nnected.
HTTP request sent, awaiting response... 200 OK
Length: 176721817 (169M) [application/x-bzip2]
Saving to: =93chromium-19.0.1049.3.tar.bz2?cms_redirect=3Dyes&redirect_co=
unter=3D1=94
    ...

I wonder if wget should be using the -O option to force the resulting fil=
ename?


--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


