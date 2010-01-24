Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYsVo-00016o-6F
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 03:47:43 +0100
Received: by yxe5 with SMTP id 5so1995637yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 18:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:date:subject:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=mdJEAXtHf5AV1QgFuEWES2Jb3j2Vg+WEsFlpuo7bm7k=;
	b=ZU+VWUtDi2Nm7Kx4eIYAhJ5R1QwgLAlekiJ01g8ahe3rF9qJ0dI8be945ozB0uE1Gp
	vt++n+RT3YgclYJV+SGBs8f8gQd689rV7VOB2H71MXeIKP5MDJFDgI7fcihde0eNx3Bo
	XLFaRCqGjI7sIbJDHXPgc4VD+XviNTNJw0KqY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:date:subject:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=gazvK1i4MuCZN4VxyfWl10HyuMfC6o7fxURkeU/jp6jSvtRqa4cusTw37ttZX1QoAf
	Oa5LzPScbAf37kIMm6338+2YVqyM0peDvAD1tApTfIL8i2QCyzdWvDhnf8x/fT37FGPo
	lUnMeP8iVAfvMGtMuvKzsaabvBozSH+IAyRWg=
Received: by 10.101.10.24 with SMTP id n24mr6081314ani.78.1264301120243;
	Sat, 23 Jan 2010 18:45:20 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 6sm1298966ywc.8.2010.01.23.18.45.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 18:45:19 -0800 (PST)
Date: Sun, 24 Jan 2010 10:45:00 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u60m9axmmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: linux-titan-sh4-2.6.21: offset to unaligned destination error when compiling linux-titan-sh4 kernel
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
X-List-Received-Date: Sun, 24 Jan 2010 02:47:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys:
   I tried to compile openembedded using the following configuration:
MACHINE=titan
DISTRO=micro
LIBC=eglibc
   When compiling linux kernel. I met the lots of errors like below:
|   CC      lib/random32.o
| {standard input}: Assembler messages:
| {standard input}:460: Error: offset to unaligned destination
| make[2]: *** [net/802/psnap.o] Error 1

Has anyone ever built kernel for titan machine successfully?

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.co


