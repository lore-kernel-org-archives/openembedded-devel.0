Received: from [203.97.33.68] (helo=smtp5.clear.net.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthew@4d-electronics.co.nz>) id 1Mg4Wt-0006Gu-0q
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 00:30:16 +0200
Received: from tardis.4d-electronics.co.nz
	(202-0-56-223.cable.telstraclear.net [202.0.56.223])
	by smtp5.clear.net.nz (CLEAR Net Mail)
	with ESMTP id <0KOY00IKADOK0L00@smtp5.clear.net.nz> for
	openembedded-devel@lists.openembedded.org; Wed,
	26 Aug 2009 10:12:21 +1200 (NZST)
Received: from localhost (localhost [127.0.0.1])	by tardis.4d-electronics.co.nz
	(Postfix) with ESMTP id 2C5A55CE25B	for
	<openembedded-devel@lists.openembedded.org>; Wed,
	26 Aug 2009 10:12:20 +1200 (NZST)
Received: from tardis.4d-electronics.co.nz ([127.0.0.1])
	by localhost (tardis.4d-electronics.co.nz [127.0.0.1])
	(amavisd-new, port 10024)	with ESMTP id rICutqT14kNn	for
	<openembedded-devel@lists.openembedded.org>; Wed,
	26 Aug 2009 10:12:19 +1200 (NZST)
Received: from [192.168.1.129] (unknown [192.168.1.129])
	by tardis.4d-electronics.co.nz (Postfix) with ESMTPS id 8C4915CE246	for
	<openembedded-devel@lists.openembedded.org>; Wed,
	26 Aug 2009 10:12:19 +1200 (NZST)
Date: Wed, 26 Aug 2009 10:12:19 +1200
From: Matthew Dombroski <matthew@4d-electronics.co.nz>
In-reply-to: <4A93A9E3.7090605@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Message-id: <4A9461C3.2000406@4d-electronics.co.nz>
MIME-version: 1.0
X-Virus-Scanned: by Amavis+SpamAssassin+ClamAV and more at	4d-electronics.co.nz
X-Spam-Flag: NO
X-Spam-Score: -1.44
References: <4A937831.2000304@4d-electronics.co.nz> <4A93A9E3.7090605@epfl.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.1) Gecko/20090715
	Thunderbird/3.0b3
X-Spam-Status: No, score=-1.44 tagged_above=-99 required=5
	tests=[ALL_TRUSTED=-1.44, AWL=-0.000]
X-Spam-Level: 
Subject: Re: [PATCH] Add toolchain file generation to cmake bbclass
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
X-List-Received-Date: Tue, 25 Aug 2009 22:30:18 -0000
X-Groupsio-MsgNum: 12760
Content-type: multipart/mixed; boundary=------------020909000902030007020709

--------------020909000902030007020709
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> I have had no problem with boost and with Qt4, I have been able to
> achieve similar results without the toolchain file, only by using a
> qt.conf file as Zecke had suggested to me.
I'm using boost-1.39 and found i needed to set Boost_COMPILER or it 
wouldn't find libraries. (Oh how I hate bjam, but thats another story...)

Setting Qt environment data in cmake.bbclass may seem a bit out of 
place.  When you consider that cmake is distributed with scripts for 
configuring/detecting Qt it doesn't seem too bad.
It is definitly tidier than generating a qt.conf in every recipe. Adding 
all the Qt info in EXTRA_OECMAKE is doing the same work twice.

> Although the toolchain file is the preferred value according to the
> cmake documentation, it has not been necessary to me.

The effect of a toolchain file is the same as that of defining lots of 
options in EXTRA_OECMAKE.
personally, I think it is cleaner. The ability to use it outside of 
openembedded is really useful to me also.

~Matt


--------------020909000902030007020709
Content-Type: text/x-vcard; charset=utf-8;
 name="matthew.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="matthew.vcf"

begin:vcard
fn:Matthew Dombroski
n:Dombroski;Matthew
org:4D Electronics Limited
adr:Sydenham;;54 Wordsworth St;Christchurch;;8013;New Zealand
email;internet:mdombroski@4d-electronics.co.nz
tel;work:(643) 982 1113
tel;cell:0211321773
x-mozilla-html:FALSE
url:www.4d-electronics.co.nz
version:2.1
end:vcard


--------------020909000902030007020709--
