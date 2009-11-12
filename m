Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1N8XnZ-0002Hf-M7
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 12:25:12 +0100
Received: by ey-out-1920.google.com with SMTP id 26so485977eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 03:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=EDDpiHvzJuuzDRouqRGLNaPCToxOzbnreY0O2feY2Vc=;
	b=g5ZucPiev08fspbUzGeiEvDYD1o97mla7CYp6Hn2r281WoN2DQnAlGh2OlvQ0KVJRa
	gHFLUiDnhyVDEF1HibwKyf4X2XkfmjyxEu+lR9WifsGj48/6GgVn236Xw17IK7av7zHy
	R68VDPW57VgOy5L2s+Ax4wjUKF/KRWE/4bDvU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=vc5DHt3KcH9O2L+uuKXiDuVsZ4ECUtLLswwGjXgCKtyQ1Ffi/7jk13i6tTZndFrwLz
	lxJXXmwyLqQAhXr2SQ24q0UaBEns/6tjyKOZJXjuDkvj9WDMcAu2z+MoChgSXd1L/QQF
	AC2eTFToQzyLNG/66WZZnv1BgASLwYL6Kps4k=
Received: by 10.213.0.135 with SMTP id 7mr3178241ebb.64.1258021184163;
	Thu, 12 Nov 2009 02:19:44 -0800 (PST)
Received: from ?163.242.202.161? ([91.213.169.4])
	by mx.google.com with ESMTPS id 23sm3024479eya.36.2009.11.12.02.19.41
	(version=SSLv3 cipher=RC4-MD5); Thu, 12 Nov 2009 02:19:42 -0800 (PST)
Message-ID: <4AFBE12F.9070802@gmail.com>
Date: Thu, 12 Nov 2009 13:19:27 +0300
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.22 (X11/20090706)
MIME-Version: 1.0
To: Holger Hans Peter Freyther <holger+oe@freyther.de>
References: <hdfdoe$kj7$1@ger.gmane.org>
	<200911120217.46744.holger+oe@freyther.de>
In-Reply-To: <200911120217.46744.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 74.125.78.145
X-SA-Exim-Mail-From: dbaryshkov@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Blackfin toolchain question
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
X-List-Received-Date: Thu, 12 Nov 2009 11:25:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Wednesday 11 November 2009 23:27:26 Dmitry Eremin-Solenikov wrote:
>> Hello,
>>
>> I'm currently trying to restore/update blackfin toolchain. One of the major
>>  problems I've stumbled upon are versioned scripts/export symbols.
>>  Basically there are lot's of software starting from g++ itself that have
>>  symbol versioning scripts. The problem is that blackfin arch prepends all
>>  symbols with underscore, thus breaking all that scripts.
> 
> 
> Do you have a link to the ABI? Isn't this underscore thingie defined by SystemV 
> ABI?

I don't have a link to Blackfin ABI. However according to 
http://docs.blackfin.uclinux.org/doku.php?id=toolchain:application_binary_interface
underscore is a part of ABI.

-- 
With best wishes
Dmitry



