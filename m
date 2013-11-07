Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.9])
	by mail.openembedded.org (Postfix) with ESMTP id C53126D2FB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 16:25:28 +0000 (UTC)
Received: from [216.82.249.131:4344] by server-9.bemta-12.messagelabs.com id
	76/6F-09044-CDEBB725; Thu, 07 Nov 2013 16:25:00 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-2.tower-28.messagelabs.com!1383841499!2647388!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.9.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21831 invoked from network); 7 Nov 2013 16:24:59 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-2.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	7 Nov 2013 16:24:59 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 7 Nov 2013 10:25:02 -0600
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.158.1;
	Thu, 7 Nov 2013 10:24:58 -0600
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 7 Nov 2013 17:24:56 +0100
Message-ID: <527BBED7.4010806@digi.com>
Date: Thu, 7 Nov 2013 17:24:55 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
References: <1383840784-13159-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1383840784-13159-1-git-send-email-eric@eukrea.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] cherokee: use cherokee-project.de mirror
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
X-List-Received-Date: Thu, 07 Nov 2013 16:25:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Eric,

On 07/11/13 17:13, Eric Bénard wrote:
> -SRC_URI = "ftp://ftp.osuosl.org/.1/cherokee/1.2/${PV}/cherokee-${PV}.tar.gz \
> +SRC_URI = "http://www.cherokee-project.de/mirrors/cherokee/1.2/1.2/${PV}/cherokee-${PV}.tar.gz \

The German mirror of cherokee-project seems to have a copy of the 
tarball (hopefully it will last) but in your patch there is an extra 
*1.2* that it should not be. The correct URL:

<http://www.cherokee-project.de/mirrors/cherokee/1.2/1.2.98/cherokee-1.2.98.tar.gz>

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

