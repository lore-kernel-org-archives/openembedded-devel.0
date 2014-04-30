Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 383 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 16:19:55 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.206])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3DD65D0D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 16:19:54 +0000 (UTC)
Received: from [216.82.241.132:26001] by server-14.bemta-8.messagelabs.com id
	53/9F-17171-B2121635; Wed, 30 Apr 2014 16:13:31 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-2.tower-45.messagelabs.com!1398874408!28825309!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22057 invoked from network); 30 Apr 2014 16:13:31 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-2.tower-45.messagelabs.com with RC4-SHA encrypted SMTP;
	30 Apr 2014 16:13:31 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 30 Apr 2014 11:13:25 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.342.0; Wed, 30 Apr 2014 11:13:28 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 30 Apr 2014 18:13:26 +0200
Message-ID: <53612125.8030702@digi.com>
Date: Wed, 30 Apr 2014 18:13:25 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver] cherokee webserver SRC_URI broken again
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
X-List-Received-Date: Wed, 30 Apr 2014 16:19:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Seems that cherokee webserver is missing again. The mirror that was set 
last time to download the package from is not accessible anymore [1].

On the mirrors page [2] there are some more; most of them are also down 
but there is still some of them that contain the package.

So at this point I think it's better to just put the package in one of 
the yoctoproject mirrors. If you think that we should use one of the 
still-working-mirrors let me know and I'll cook a patch for it.

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.


[1] 
http://www.cherokee-project.de/mirrors/cherokee/1.2/1.2.98/cherokee-1.2.98.tar.gz
[2] http://cherokee-project.com/downloads.html

