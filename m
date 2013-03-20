Received: from mail-ob0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UINoy-0002vY-DG
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 19:33:13 +0100
Received: by mail-ob0-f179.google.com with SMTP id un3so1968517obb.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 11:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=Qr7OGgHRf78C+HqIuVhwCdDKvfJW+ysrrH2LAW+IPew=;
	b=n/n4QyIb9JDTdHkK4r7xUFKfOnV1o9jbQ1rgpsfJ0j27OWDLisZuqgi+yU8PPFS5/g
	nl/mMyeA88ef0uqBZ0kNrUl8Vn7A/17ujKpiB80Iu8WauVezmPqdtR47Frsoykr5w2yv
	LWS6kqh9bG1XVJ/5gLQP91izLezjkq2TMchjmziGE11dOAnCshk/OqWbz8nbRdvlOvvG
	FUHiyz/QNqrIbpSB3Ur4aBzrFH+87TXIWsJuNJ4scVWiOiec0mvjIihBpurz/2s54KT9
	4kDpb0fDe9Ycy4mxskWOf8j5KrZVg7TJT3UWJnwV97TTt2Km1LHDrCEHXjLW8zcOiK8v
	fHYg==
X-Received: by 10.182.220.10 with SMTP id ps10mr4879820obc.21.1363803376593;
	Wed, 20 Mar 2013 11:16:16 -0700 (PDT)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id bq8sm3050665obc.9.2013.03.20.11.16.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 11:16:15 -0700 (PDT)
Message-ID: <5149FCF2.2090907@felipetonello.com>
Date: Wed, 20 Mar 2013 11:16:18 -0700
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1363730433-8555-1-git-send-email-ftonello@cercacor.com>
	<20130320100503.GA3220@jama>
In-Reply-To: <20130320100503.GA3220@jama>
X-Gm-Message-State: ALoCoQkeF9ka583HXn6yLePMruigW7zHu6N2NBC3q4wYzM+ArA6hMWgi6JB6jpd/wt8utsq2wVgH
Subject: Re: [meta-oe][PATCH v4] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Wed, 20 Mar 2013 18:33:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 03/20/2013 03:05 AM, Martin Jansa wrote:
> On Tue, Mar 19, 2013 at 03:00:33PM -0700, eu@felipetonello.com wrote:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> Fingerterm is a terminal emulator for Nokia Harmattan, but it works in any Qt4
>> environment.
>>
>> This recipe can be extended by a .bbappend to add .desktop, icon and others to
>> the target device.
>
> This part of commit message can be dropped now right?

Yes, that's fine.

Thanks

Felipe

>
> I'll drop it before pushing it (if it builds OK on jenkins) no need for
> v5 if nobody sends more comments.
>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> ---
>>   meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   44 +++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>>
>> diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>> new file mode 100644
>> index 0000000..59533a4
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>> @@ -0,0 +1,44 @@
>> +DESCRIPTION = "A terminal emulator for Harmattan (Nokia N9/N950) with a custom \
>> +virtual keyboard and usability-enhancing features such as URL grabber, pan \
>> +gestures and customizable shortcut menu. Designed especially to be used with \
>> +screen and irssi."
>> +HOMEPAGE = "http://hqh.unlink.org/harmattan"
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +SECTION = "qt/app"
>> +
>> +PR = "r0"
>> +
>> +inherit qt4x11 pkgconfig
>> +
>> +SRC_URI = " \
>> +  http://hqh.unlink.org/harmattan/fingerterm-${PV}.tar.gz \
>> +"
>> +
>> +SRC_URI[md5sum] = "d53b0f463c025583cd52accf95715448"
>> +SRC_URI[sha256sum] = "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a044b6674dd82d95150"
>> +
>> +S = "${WORKDIR}/${PN}"
>> +
>> +FILES_${PN} = " \
>> +  ${bindir}/${PN} \
>> +  ${datadir}/applications/${PN}.desktop \
>> +  ${datadir}/pixmaps/${PN}.png \
>> +"
>> +
>> +do_install() {
>> +  install -d ${D}${bindir}
>> +  install -m 0744 ${S}/${PN} ${D}${bindir}
>> +
>> +  sed -i -e '/Exec.*/d' fingerterm.desktop
>> +  sed -i -e '/Icon.*/d' fingerterm.desktop
>> +
>> +  echo 'Exec=${bindir}/${PN}' >> fingerterm.desktop
>> +  echo 'Icon=${PN}' >> fingerterm.desktop
>> +
>> +  install -d ${D}${datadir}/applications
>> +  install -m 0644 ${S}/${PN}.desktop ${D}${datadir}/applications
>> +
>> +  install -d ${D}${datadir}/pixmaps
>> +  install -m 0644 ${S}/${PN}.png ${D}${datadir}/pixmaps
>> +}
>> \ No newline at end of file
>> --
>> 1.7.9.5
>>


