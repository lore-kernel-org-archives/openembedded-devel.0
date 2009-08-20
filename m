Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1Mdzhl-0003zY-Hs
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 06:56:56 +0200
Received: by ewy21 with SMTP id 21so4755734ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 21:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=Wl8OpKyfVg+ja1g0qZWaE62K8+qDfnsVarO0AqXhgqc=;
	b=dOwv5iCN7vjUi8gG+VlEaV7V4RBTNdQQ7KeJnITqnUfR/jRFmUtJ58RRPkw9hxLOvC
	kHfvVp71o8NMavxMQj/EhT5RvcxUsvvQUNM2HhqK/w7HiIRVtiwK2ilqViRfc4XR5EHd
	8rV+AJqGrabg3XClA3YyrMWqnchJVx3h4PZ0I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=sQKMKgLImz9fOyMevMnBsEn4vWL40uCeYzeTcT+mcEqMbCFRR8nvT+IhThVrYd0ZjB
	egUy++DbbU/JJGM/5MLNXrQKQyX0zrDR+tE0I8btsTgU8eFWpS9LilVNIfMJrl0Jhpnu
	rXvPu4p8BKvBWL7Rh1DuCF0ezdMpCSWCjc5g8=
Received: by 10.210.88.3 with SMTP id l3mr6408979ebb.96.1250743176751;
	Wed, 19 Aug 2009 21:39:36 -0700 (PDT)
Received: from ?192.168.0.7? ([92.255.146.220])
	by mx.google.com with ESMTPS id 10sm556782eyz.41.2009.08.19.21.39.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 19 Aug 2009 21:39:36 -0700 (PDT)
Message-ID: <4A8CD3A8.900@gmail.com>
Date: Thu, 20 Aug 2009 10:40:08 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: bitbake ignores DEFAULT_PREFERENCE
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
X-List-Received-Date: Thu, 20 Aug 2009 04:56:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I want to port OE to LPC3250 board and now I'm trying to build 
helloworld-image.

I've created lpc3250.conf in conf/machine:
TARGET_ARCH = "arm"
PACKAGE_EXTRA_ARCHS = "armv5te"
TARGET_CC_ARCH = "-fsigned-char -mfpu=vfp -mfloat-abi=softfp"

Then I've added DEFAULT_PREFERENCE_lpc3250 = "1" to 
'recipes/linux/linux_2.6.27.bb', but 'bitbake -v helloworld-image' 
downloads 2.6.23 kernel all the same. Re-reading all recipes database 
make no sense.

Could anybody advise, how this can be solved? I need to use exactly 
2.6.27 kernel as I know that it definitely works.

Thanks in advance.

-- 
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



