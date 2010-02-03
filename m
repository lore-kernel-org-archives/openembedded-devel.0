Received: from mail-pz0-f184.google.com ([209.85.222.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NceKN-0000qB-2f
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 13:27:30 +0100
Received: by pzk14 with SMTP id 14so1266036pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 04:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:cc:mime-version:content-transfer-encoding:from:organization
	:message-id:user-agent;
	bh=59J0eDfcSsWyDMHFFtDI8hxYYhIPJxZYEEh5jdZq7fs=;
	b=M97ZUTtyMRpmkTBL5E4xxk/TVawnpVUwo9t8/pXFz4DquhhATz92EWDIX3m8cbKojU
	nEnzTGjGl+3CBn0gwllV7IlbuiASehIhIN1Z4CGuP9IRJzIeP3rihKWXD134CWV9I6WX
	bHPjsQPTXD7CBh6BWWXEU+i98P9VmCs/bB3vI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:cc:mime-version
	:content-transfer-encoding:from:organization:message-id:user-agent;
	b=Tn6oA0tIeWZHxfFBYZa7Uh5i0SvQHMcWdjWgLUvGIHoGbYIOm+UeblUbcKVNdYkMXk
	EE6/8nQe+LEwrGwSVxXqb3FcH52kc9IXwASLoWLrbyjNJ81fNsPq96hO3D7bHecQMjlG
	oYVMd8Ma6RTrMAZACluWxyriE5i1utapnzz48=
Received: by 10.114.252.39 with SMTP id z39mr4516719wah.93.1265199898288;
	Wed, 03 Feb 2010 04:24:58 -0800 (PST)
Received: from camelguo ([123.162.69.234])
	by mx.google.com with ESMTPS id 21sm6372840pzk.11.2010.02.03.04.24.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Feb 2010 04:24:57 -0800 (PST)
Date: Wed, 03 Feb 2010 20:24:44 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7jwri1mmn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.184
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: slapin@ossfans.org
Subject: compiling linux-hackndev-2.6 failed when MACHINE=palmtc DISTRO=micro and LIBC=glibc
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
X-List-Received-Date: Wed, 03 Feb 2010 12:27:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
    When compiling linux-hackndev-2.6, I met the following error:
|   LD [M]  drivers/input/touchscreen/wm97xx-ts.o
| drivers/input/touchscreen/palmtc_ts.c: In function  
'ucb1400_get_gpio_val':
| drivers/input/touchscreen/palmtc_ts.c:288: error: 'ucb_static_copy'  
undeclared (first use in this function)
| drivers/input/touchscreen/palmtc_ts.c:288: error: (Each undeclared  
identifier is reported only once
| drivers/input/touchscreen/palmtc_ts.c:288: error: for each function it  
appears in.)
| drivers/input/touchscreen/palmtc_ts.c: In function  
'ucb1400_get_gpio_dir':
| drivers/input/touchscreen/palmtc_ts.c:294: error: 'ucb_static_copy'  
undeclared (first use in this function)
| drivers/input/touchscreen/palmtc_ts.c: In function  
'ucb1400_set_gpio_val':
| drivers/input/touchscreen/palmtc_ts.c:300: error: 'ucb_static_copy'  
undeclared (first use in this function)
| drivers/input/touchscreen/palmtc_ts.c: In function  
'ucb1400_set_gpio_dir':
| drivers/input/touchscreen/palmtc_ts.c:313: error: 'ucb_static_copy'  
undeclared (first use in this function)
| drivers/input/touchscreen/palmtc_ts.c: In function 'ucb1400_ts_probe':
| drivers/input/touchscreen/palmtc_ts.c:924: error: 'ucb_static_copy'  
undeclared (first use in this function)
| make[3]: *** [drivers/input/touchscreen/palmtc_ts.o] Error 1

for more detailed information, please see  
http://tinderbox.openembedded.net/packages/458247/

Thanks a lot!


-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


