Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.194])
	by mail.openembedded.org (Postfix) with ESMTP id 689F26D1FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 16:02:30 +0000 (UTC)
Received: from [216.82.241.196:14345] by server-2.bemta-8.messagelabs.com id
	F8/63-22589-799BB725; Thu, 07 Nov 2013 16:02:31 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-2.tower-46.messagelabs.com!1383840149!30861893!2
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.9.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23710 invoked from network); 7 Nov 2013 16:02:29 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-2.tower-46.messagelabs.com with RC4-SHA encrypted SMTP;
	7 Nov 2013 16:02:29 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 7 Nov 2013 10:02:32 -0600
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.327.1; Thu, 7 Nov 2013 10:02:28 -0600
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 7 Nov 2013 17:02:26 +0100
Message-ID: <527BB991.8060008@digi.com>
Date: Thu, 7 Nov 2013 17:02:25 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <5256CE06.60502@digi.com>	<20131010213127.14c4f478@e6520eb>	<527BA8AE.4000306@digi.com>
	<20131107161445.589ad9ea@e6520eb>
In-Reply-To: <20131107161445.589ad9ea@e6520eb>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: cherokee wrong SRC_URI (was Dylan backports)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Nov 2013 16:02:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Eric,

On 07/11/13 16:14, Eric Bénard wrote:
> that's now pushed, thanks for the reminder.
>
> Eric

Well I should have probably checked that the mirror was still working 
before sending my e-mail but you know ... Murphy's law.

The thing is that for cherokee the mirror I used to download the package 
from has removed it since i sent the patch a couple of months ago.

I'm sorry to have pushed you to merge the patches. Anyway from 
meta-openembedded point of view the status has *not* gone any worse. It 
was not working before (with old cherokee url) and it's not working now 
as well.

I've found a couple of sites with the original package (same md5sum and 
sha256sum):

<ftp://ftp.nluug.nl/pub/internet/cherokee/1.2/1.2.98/cherokee-1.2.98.tar.gz>
<ftp://ftp.heanet.ie/mirrors/cherokee/1.2/1.2.98/cherokee-1.2.98.tar.gz>

but at this moment I'm not sure whether it's worth to keep changing the 
SRC_URI time and time again.

Probably the way to go is to revert my patch leaving the original 
cherokee as a reference and include the package in any of the 
yoctoproject mirrors.

By the way the recipe is now broken not only in Dylan, but also in 
*Dora* and *master*.

Comments?

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

