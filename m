Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Ootnf-0007QV-4C
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 09:56:36 +0200
Received: (qmail 29314 invoked by uid 503); 27 Aug 2010 08:17:13 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 27 Aug 2010 08:17:13 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 27 Aug 2010 09:56:08 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 27 Aug 2010 09:56:07 +0200
Message-ID: <4C776F96.2000307@eukrea.com>
Date: Fri, 27 Aug 2010 09:56:06 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282858170-31241-1-git-send-email-eric@eukrea.com>	<1282858170-31241-2-git-send-email-eric@eukrea.com>
	<4C76E762.4030307@mentor.com>
In-Reply-To: <4C76E762.4030307@mentor.com>
X-Ovh-Tracer-Id: 8040895661608643913
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ncurses-5.7 : fix sdk build
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
X-List-Received-Date: Fri, 27 Aug 2010 07:56:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 27/08/2010 00:14, Tom Rini a écrit :
> Eric Bénard wrote:
>
>> @@ -170,7 +170,7 @@ pkg_prerm_ncurses-tools () {
>> fi
>> }
>>
>> -BBCLASSEXTEND = "native sdk"
>> +BBCLASSEXTEND = "native nativesdk"
>
> Don't remove sdk from here, just add nativesdk. We haven't fully
> converted everything.
>
in fact there is a problem when keeping sdk + nativesdk :

ENABLE_WIDEC_virtclass-nativesdk = "false"
is no more taken in account.

_virtclass-sdk or _sdk or _${PN}-sdk are also not good overides.

Do you have any idea how to fix this ?

Eric


