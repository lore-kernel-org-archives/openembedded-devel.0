Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NP6VG-0001rd-JG
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 04:42:45 +0100
Received: by ywh8 with SMTP id 8so9845576ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Dec 2009 19:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject:date
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=IvEpqw2vQ4dQHz3NdWLXH8hwC0pQYa9uTmwaJ5Gbkjk=;
	b=GzkS2Hjb04yAvbbQmj1LuGDEgfi607cvwPvfeyeTQ14d2JXgCrqd2PypsMfC/k2aNG
	jRYq3uisqyz8TrXycxh9FdBOspOHOxhoHgHHk/jWRiUYYQ83QLTHoK63gEd89u+N+bwK
	PbBIj+zochbChwpiNyjoeIlEqHVrZY1TD/y5M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:date:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=AdmHJC0T+Fy7UrIW712C9XyN57ZC5gjUO/hHAhxOZLAgvKlmgYMaDg8BL+gsdJlNQF
	XMwVeReNTEWSuXuY0K3YL3v9wnKagVi/kulMjH7FBODt1Fo/VQjGEmiWiuwO9V94IGF0
	+MsEvKHsxZAKuLwBMYOlNFUna4vuyNmS8Ko2A=
Received: by 10.91.109.16 with SMTP id l16mr3070595agm.120.1261971645656;
	Sun, 27 Dec 2009 19:40:45 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.70.72])
	by mx.google.com with ESMTPS id 21sm10599328iwn.2.2009.12.27.19.40.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 27 Dec 2009 19:40:44 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Dec 2009 11:40:38 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5mptvjzmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Install base-file failed due to lack of usbd
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
X-List-Received-Date: Mon, 28 Dec 2009 03:42:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
    the installation of base-file failed due to lack of usbd. I found this  
bug when
1. MACHINE=qemumips and DISTRO=micro (using eglibc)
2. MACHINE=qemuarm and DISTRO=micro (using eglibc)

install: cannot create regular file  
`/media/work-disk/workdir/oe-qemumips-micro-eglibc/work/qemumips-oe-linux/base-files-3.0.14-r89/image/etc/default/usbd':  
No such file or directory

It seems that the base-file recipe may have some problem.

see the following URLs for more detailed information:
http://tinderbox.openembedded.net/packages/392296/
http://tinderbox.openembedded.net/packages/391393/

Thanks a lot


-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


