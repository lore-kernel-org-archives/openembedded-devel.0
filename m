Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbTI8-0007BE-RE
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 07:28:20 +0100
Received: by pxi9 with SMTP id 9so2972252pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 22:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=MmPIKXBYsl5ayuH9Ejrj57K36YWk4q8a3fJU/hUaDSs=;
	b=r/nSOYl6/QGP+hYVsSr5IB+hq3yZ0CsWcsrnPoVVCx3Iv2o/5olpHFBepYf/3LvwfK
	EMwPRwp2OdaITjhPsvmV3fGPByuiS3AjBAg4KfdqRFLHzHjuKq7O0Wv0C//aZUkT/Kqb
	dEmeEIvyzG2/DW6+4MuEIhcj0ZjTlxu7NKuRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=vCxUjmwPUk0HF00JqBvt0D/ZcyLTIJ0LrQG0DVK38bC2vDNE3QMkk7Ac5B9m4wmcnI
	79C3cXKTSYX/6V2FQccYV7vlvWwcftu9TCtgBFCX+omfKOR+tC2SVmZGt5Pt9tZRl9MV
	Ey6mkWtY5Wx/fCuqf9MWFZhvswETxjW7/Ww0g=
Received: by 10.141.91.10 with SMTP id t10mr2036079rvl.127.1264919150905;
	Sat, 30 Jan 2010 22:25:50 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 21sm3271583pzk.3.2010.01.30.22.25.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 22:25:50 -0800 (PST)
Date: Sun, 31 Jan 2010 14:25:42 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dv44vqmn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: circular dependency when building linux_2.6.25.bb
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
X-List-Received-Date: Sun, 31 Jan 2010 06:28:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I tried to build openembedded with the following configration in my  
local.conf
MACHIN=at91-l9260
DISTRO=micro
LIBC=glibc

But I failed to start building and met the following error:
ERROR: Unbuildable tasks were found.
These are usually caused by circular dependencies and any circular  
dependency chains found will be printed below. Increase the debug level to  
see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
   Task 384 (/opt/workdir/oe/openembedded/recipes/linux/linux_2.6.25.bb,  
do_deploy) (depends: set([388, 108, 390]))
   Task 389 (/opt/workdir/oe/openembedded/recipes/linux/linux_2.6.25.bb,  
do_compulab_image) (depends: set([384]))
   Task 388 (/opt/workdir/oe/openembedded/recipes/linux/linux_2.6.25.bb,  
do_package) (depends: set([160, 144, 770, 389, 390, 32, 754, 176, 786,  
1014, 982, 998, 380]))

It seems that the linux_2.6.25.bb recipe causes dependency loops.

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


