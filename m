Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1OMLpO-0003GG-TK
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 16:00:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 489902C7EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 13:53:03 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ViiRYWSJIso
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 13:52:58 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 587912C798
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 13:52:58 +0000 (UTC)
Message-ID: <4C0F9D6B.6000105@gmail.com>
Date: Wed, 09 Jun 2010 15:55:55 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1275578113-17291-1-git-send-email-chase.maupin@ti.com>	<hu8ivf$250$1@dough.gmane.org>
	<20100603165055.GA4402@denix.org>
In-Reply-To: <20100603165055.GA4402@denix.org>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4-embedded: rename qtdemo file
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
X-List-Received-Date: Wed, 09 Jun 2010 14:00:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko ha scritto, Il 03/06/2010 18:50:
> On Thu, Jun 03, 2010 at 05:50:06PM +0200, Koen Kooi wrote:
> On 03-06-10 17:15, Chase Maupin wrote:
>>>> * Changed the name of the qtdemo exectable installed
>>>>   in the /usr/bin directory to qtdemoE for Qt
>>>>   embedded builds.  This allows the Qt embedded
>>>>   version of the demos package to co-exist with
>>>>   the Qt X11 version.
>>>> * Changed the demos package file list to accept
>>>>   both qtdemo and qtdemoE.
>>>>
>>>> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Acked-by: Koen Kooi <k-kooi@ti.com>
> 
>> Applied, thanks.
> 
>>>> ---
>>>>  recipes/qt4/qt-4.6.2.inc     |    3 +++
>>>>  recipes/qt4/qt4-embedded.inc |    2 +-
>>>>  recipes/qt4/qt4.inc          |    4 ++--
>>>>  3 files changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/recipes/qt4/qt-4.6.2.inc b/recipes/qt4/qt-4.6.2.inc
>>>> index e89cf17..4a9f077 100644
>>>> --- a/recipes/qt4/qt-4.6.2.inc
>>>> +++ b/recipes/qt4/qt-4.6.2.inc
>>>> @@ -57,6 +57,9 @@ do_install_append() {
>>>>  	for i in rcc uic moc ; do
>>>>  		install -m 0755 ${S}/bin/$i ${D}${bindir}/
>>>>  	done
>>>> +
>>>> +	#Append an E to the qtdemo file
>>>> +	mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
>>>>  }
>>>>  

This patch drive to an error with qt/X11
ERROR: Build of
/home/koan/devel/openembedded/recipes/qt4/qt4-x11-free_4.6.2.bb
do_install fail

| mv:
`/home/koan/devel/build/kaeilos/tmp/work/armv5te-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/bin/qtdemo'
and
`/home/koan/devel/build/kaeilos/tmp/work/armv5te-oe-linux-gnueabi/qt4-x11-free-4.6.2-r17.2/image/usr/bin/qtdemo'
are the same file

looks like the Append an E to the qtdemo file han not been tested with
qt/X11, so I'd like to change recipes/qt4/qt-4.6.2.inc in this way

#Append an E to the qtdemo file
if [${QT_LIBINFIX} == "E"] ; then
	    mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
fi


--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com


