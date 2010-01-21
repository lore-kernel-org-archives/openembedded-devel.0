Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NXnNc-0004fC-Eb
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 04:06:47 +0100
Received: by yxe5 with SMTP id 5so3637018yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 19:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:date:subject
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=6cxx5NeDxwo68JakproHm+wJWNhNb5wf65VtHJdZ8xw=;
	b=lD4RaPS/3rww0pLBKu6VWaFwxph6oMbF+BnzgpAEbArt/6o43Z8FCwWMsDH0H+gtOL
	Fqwmo7WdqY0GAHAVtVzcoHODrvhhlLYUJsv4jI/VwpzHOcSGlzzBqThm6ewUbql3c37r
	nmYIOHuZoqgQ5lRep+QUhs+bMD8+jz9iO6tZM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:date:subject:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=wJh2EEifBgQ3V3qs/ch9Xw19a4JR8bkC0n30cMyaYhCs7i1elPo1rZPYNZ31jMsK4/
	ME8kigvWAy78QjRIKRyDra97E7sAvWJsu0THcFtUDk4OtpS0tDNrXoAVJE1OYRovEx08
	6l9KnxW90z+14o2VtbFR+Z/5S0wZ4u7+9RLSg=
Received: by 10.91.26.2 with SMTP id d2mr953920agj.35.1264043067381;
	Wed, 20 Jan 2010 19:04:27 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.100.209])
	by mx.google.com with ESMTPS id 39sm198835yxd.27.2010.01.20.19.04.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 19:04:26 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Jan 2010 11:04:19 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6u35hgwmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: circular dependency on do_package and do_deploy in recipes/linux/linux-storcenter_2.6.27.7.bb
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
X-List-Received-Date: Thu, 21 Jan 2010 03:06:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I build my openembedded project using the following setting:
MACHINE=storcenter
DISTRO=micro
LIBC=eglibc

   But the build failed to execute due to the following error:
ERROR: Task  
/media/work-disk/testslave/oe_gss_inc_change_allinone/build/../openembedded/recipes/linux/linux-storcenter_2.6.27.7.bb  
(do_package) has circular dependency on  
/media/work-disk/testslave/oe_gss_inc_change_allinone/build/../openembedded/recipes/linux/linux-storcenter_2.6.27.7.bb  
(do_deploy)
   I guess that it is caused by the following line in  
linux-storcenter_2.6.27.7.bb:
addtask deploy before do_package after do_install
because the kernel has defined the dependency in kernel.bbclass
554 addtask deploy before do_build after do_package
So, do_package and do_deploy causes the circular dependency.

I think it can be solved just remove the addtask in  
linux-storcenter_2.6.27.7.bb. Am I right?

Thanks a lot

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


