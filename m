Return-Path: <pn@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 026D179F6C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 15:59:38 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42nNtM1GPPz1qwHQ;
	Sat,  3 Nov 2018 16:59:39 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42nNtM13pCz1qqkn;
	Sat,  3 Nov 2018 16:59:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id M8rbnjxtv3gz; Sat,  3 Nov 2018 16:59:38 +0100 (CET)
X-Auth-Info: 3TFrRpc05Dkl8lrv2Z50YPiKm5TgaldJSlquS5ey798=
Received: from [192.168.178.26] (unknown [62.91.105.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat,  3 Nov 2018 16:59:38 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
From: Parthiban Nallathambi <pn@denx.de>
Organization: DENX Software Engineering GmbH
Message-ID: <a82232e3-5514-ea37-1d90-30f6a29e0aca@denx.de>
Date: Sat, 3 Nov 2018 16:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
Subject: [thud] libdevmapper: LVM2.2.02.180.tgz file not found
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Nov 2018 15:59:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hello All,

I am currently facing compilation issue with the libdevmapper. For the compilation
logs I understand that the SRC_URI needs to be adjusted.

Current URI: ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.180.tgz
BUt the file resides in: ftp://sources.redhat.com/pub/lvm2/releases/LVM2.2.02.180.tgz

Does this needs to be fixed? Or the source tarball will be moved to parent directory
in redhat FTP? Or am i missing something?

Log:
====
--2018-11-03 15:37:47--  ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.180.tgz
           => ‘/work/downloads/LVM2.2.02.180.tgz’
Resolving sources.redhat.com (sources.redhat.com)... 209.132.183.64
Connecting to sources.redhat.com (sources.redhat.com)|209.132.183.64|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD (1) /pub/lvm2 ... done.
==> SIZE LVM2.2.02.180.tgz ... done.

==> PASV ... done.    ==> RETR LVM2.2.02.180.tgz ... 
No such file ‘LVM2.2.02.180.tgz’.
-- 
Thanks,
Parthiban N

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-22 Fax: (+49)-8142-66989-80 Email: pn@denx.de

