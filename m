Received: from [212.27.42.4] (helo=smtp4-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LpPjP-0001nB-OH
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 18:25:51 +0200
Received: from smtp4-g21.free.fr (localhost [127.0.0.1])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 429954C8099
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 18:23:03 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 230B04C8076
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 18:23:00 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 19F401840D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 18:23:02 +0200 (CEST)
Message-ID: <49D4E665.2020200@bolloretelecom.eu>
Date: Thu, 02 Apr 2009 18:23:01 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49D17F70.8020109@dls.net> <49D42B0B.4020505@dls.net>
	<gr1ujt$ga$1@ger.gmane.org>
In-Reply-To: <gr1ujt$ga$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 212.27.42.4
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make preferred openssl version match for -native recipe
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
X-List-Received-Date: Thu, 02 Apr 2009 16:26:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>> So anticipate that your builds may fail if a new version of openssl is
>> built; the failure mode would be the inability for the app to find the
>> old version of the library in the staging area.

Some packages fail in a very un-obvious way, most notably "python-native"=
 which will spew
the following error:

ImportError: No module named _md5

So far, I have found the following commonly used packages which need rebu=
ilding:

cmake-native
python-native
git-native

Cheers,
--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


