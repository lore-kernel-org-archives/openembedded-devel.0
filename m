Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 40F9172324
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 18:17:25 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1Xti5b-0003Or-L4
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2014 20:17:23 +0100
Received: from host-87-242-31-61.prtelecom.hu ([87.242.31.61]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1Xth9T-0005Lt-GI
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2014 19:17:21 +0100
Message-ID: <5476192C.2030204@pr.hu>
Date: Wed, 26 Nov 2014 19:17:16 +0100
From: Boszormenyi Zoltan <zboszor@pr.hu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Spam-Score: 0.7 (/)
X-Scan-Signature: 02d3abc61471e6dd9f9388029c518d83
X-Spam-Tracer: backend.mail.pr.hu 0.7 20141126181721Z
Subject: Escaping in PACKAGECONFIG
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
X-List-Received-Date: Wed, 26 Nov 2014 18:17:27 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hi,

what is the proper way of escaping a comma in the string specified for PACKAGECONFIG?
I would like to use something like the below in my custom PHP recipe:

PACKAGECONFIG[mysql] = ' \
                        --enable-mysqlnd="shared" \
                        --with-mysql="shared,mysqlnd" \
                        --with-mysqli="shared,mysqlnd" \
                        --with-mysql-sock=${localstatedir}/lib/mysql/mysql.sock \
                        --with-pdo-mysql="shared,mysqlnd" \
                        , \
                        ,mysql5'

With ...="shared,mysqlnd", ...="shared\,mysqlnd" or ...="shared\\,mysqlnd" I get:

ERROR: Only enable,disable,depend,rdepend can be specified!

and

ERROR: Nothing PROVIDES 'mysqlnd"' (but .../php/php_5.6.3.bb DEPENDS on or otherwise
requires it). Close matches:
  mysql5
ERROR: Required build target 'php' has no buildable providers.
Missing or unbuildable dependency chain was: ['php', 'mysqlnd"']

But, this works:

MYSQLND="shared,mysqlnd"
PACKAGECONFIG[mysql] = ' \
                        --enable-mysqlnd="shared" \
                        --with-mysql=${MYSQLND} \        
                        --with-mysqli=${MYSQLND} \                 
                        --with-mysql-sock=${localstatedir}/lib/mysql/mysql.sock \
                        --with-pdo-mysql=${MYSQLND} \                 
                        , \
                        ,mysql5'

Why?

Thanks in advance,
Zoltán Böszörményi


