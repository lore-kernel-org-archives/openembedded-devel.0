Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LyQJN-0002iP-6D
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 14:51:54 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1447214yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2009 05:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=/2OVNr1Xel0yjQGLGUAN3XxTvzDZTUZJ0bGmErw6oGc=;
	b=R1/kMfjJjXlcBZ8hhxwrhzcGBzrUOo8Am3Ttxv41ys7Y4wS4CE57Lxul+b5Ie1p977
	jcpiursz9hURLq5g63oX7X0pLqIdDfXjDPCYbc7gnbWhGgP+hQOdhrIkpCddd3FPF0xE
	R1H3bcDqigCnHMASxb1jVlTL5KpXeRFkpFBMQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=HEutUVYuKqNfh0bPaVuRGlhdGRwUF/JF7Sj33xryJIiKOgWh1P+9fVsyWcEglOBsSL
	jmyS+vsw1J6PTHXQ4QNSWyksBljS2EAbvt7guQLTsWx7yhv92R4nUeLMl0aYo5sqi2BF
	zWp3HNJSVvoWeP/WsXxXP2vfUaGB7Lb+HuXns=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.96.9 with SMTP id t9mr8384279anb.106.1240836410313; Mon, 
	27 Apr 2009 05:46:50 -0700 (PDT)
In-Reply-To: <200904271340.28227.khimov@altell.ru>
References: <200904271340.28227.khimov@altell.ru>
Date: Mon, 27 Apr 2009 09:46:50 -0300
X-Google-Sender-Auth: e568a0e649a6e831
Message-ID: <be7a9f3d0904270546u33935630ua3f0b1fee1d3e430@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] install-native
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
X-List-Received-Date: Mon, 27 Apr 2009 12:51:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Roman,

On Mon, Apr 27, 2009 at 6:40 AM, Roman I Khimov <khimov@altell.ru> wrote:
[...]
> But maybe we can just remove 'install-native' completely?

I belive the right way to handle it to fix install-native to support
what is required.

It is quite bad to depends on host apps since it will make OE non-deterministic.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


