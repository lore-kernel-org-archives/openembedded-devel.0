Return-Path: <A.Baumfalk@astro-kom.de>
X-Greylist: delayed 474 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Mar 2018 12:43:27 UTC
Received: from mailrelay-out1.netcologne.de (mailrelay-out1.netcologne.de
	[81.173.193.131])
	by mail.openembedded.org (Postfix) with ESMTP id F422478A44
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 12:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailrelay-out1.netcologne.de (Postfix) with ESMTP id 7AA4110B408
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 13:35:34 +0100 (CET)
Received: from [213.196.222.82] (helo=mailrelay-out1.netcologne.de)
	by localhost with ESMTP (eXpurgate 4.3.1)
	(envelope-from <A.Baumfalk@astro-kom.de>)
	id 5a9e8b16-5654-7f0000012729-7f000001e7a1-1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 13:35:34 +0100
Received: from ASTRO-EX1.Bensberg.de (unknown [213.196.222.82])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailrelay-out1.netcologne.de (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 13:35:34 +0100 (CET)
Received: from [192.168.8.2] (192.168.100.114) by ASTRO-EX1.Bensberg.de
	(192.168.100.26) with Microsoft SMTP Server (TLS) id 15.0.775.38;
	Tue, 6 Mar 2018 13:35:27 +0100
To: <openembedded-devel@lists.openembedded.org>
From: Arno Baumfalk <a.baumfalk@astro-kom.de>
Message-ID: <319a0294-5326-62d4-9cf6-16d6649a8fc4@astro-kom.de>
Date: Tue, 6 Mar 2018 13:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
X-Originating-IP: [192.168.100.114]
X-ClientProxiedBy: ASTRO-EX1.Bensberg.de (192.168.100.26) To
	ASTRO-EX1.Bensberg.de (192.168.100.26)
X-purgate-ID: 153929::1520339734-00005654-AAFA560F/0/0
X-purgate: clean
Subject: apache2 startup problem
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
X-List-Received-Date: Tue, 06 Mar 2018 12:43:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE

Hi,

on my system, which is based on the pyro-brances of poky and 
meta-openembedded, I have the problem, that the apache2 webserver does 
not start.
The reason seems to be in the file 
meta-oe/recipes-devtools/php/php/70_mod_php7.conf:

LoadModule php7_module lib/apache2/modules/libphp7.so

<FilesMatch "\.ph(p[2-7]?|tml)$">
     SetHandler application/x-httpd-php
</FilesMatch>

<FilesMatch "\.phps$">
     SetHandler application/x-httpd-php-source
</FilesMatch>

When checking the apache2 configuration, I get following error message:

$> /usr/sbin/apachectl configtest
AH00526: Syntax error on line 7 of /etc/apache2/modules.d/70_mod_php7.conf:
Multiple <FilesMatch> arguments not (yet) supported.

Can somebody help?
Arno

