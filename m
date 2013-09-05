Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1618A61788
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:21:52 +0000 (UTC)
Received: from [216.82.249.147:6495] by server-13.bemta-12.messagelabs.com id
	72/EB-30364-16778225; Thu, 05 Sep 2013 12:21:53 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-12.tower-29.messagelabs.com!1378383712!23138824!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.9.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29394 invoked from network); 5 Sep 2013 12:21:52 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-12.tower-29.messagelabs.com with RC4-SHA encrypted SMTP;
	5 Sep 2013 12:21:52 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 5 Sep 2013 07:22:01 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.327.1; Thu, 5 Sep 2013 07:21:51 -0500
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 5 Sep 2013 14:21:50 +0200
Message-ID: <52287758.6050506@digi.com>
Date: Thu, 5 Sep 2013 14:21:44 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <1378382068-24795-1-git-send-email-javier.viguera@digi.com>
	<20130905140917.48edcb06@e6520eb>
In-Reply-To: <20130905140917.48edcb06@e6520eb>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver] cherokee: fix SRC_URI
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
X-List-Received-Date: Thu, 05 Sep 2013 12:21:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Eric

On 05/09/13 14:09, Eric Bénard wrote:
> in fact the correct URL is now :
> https://github.com/cherokee/webserver/archive/v1.2.98.tar.gz
> so I think you can switch to :
> +SRC_URI = "https://github.com/cherokee/webserver/archive/v${PV}.tar.gz

The problem with the "official" one in github is that it is not the 
same. The checksums are different and a basic *diff* verification 
between the unpacked packages shows a bunch of differences.

The one in the OSUOSL is exactly the same (same checksums).

Regarding the mirror policies i just don't know. I was bitten by this 
problem trying to build cherokee in Dylan branch and tried to find a 
mirror. I selected OSUOSL because of its track supporting open source 
projects.

-- 
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

