Received: from [74.125.46.156] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MBtzF-000563-Ts
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 19:10:50 +0200
Received: by yw-out-1718.google.com with SMTP id 9so49128ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 10:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lNWzjtk5d6qsnxQHLbn52wsKgMASKzIBh6YbdGHpbno=;
	b=NMXBSCXZcfW7S6EbJQ/Tu9HUtV6pWolhxBIl1WhGD6GMoxI2LXIXyO6y9W9lHNOKnc
	tK/Btg8HcbIc/hKSyFz+NNr/lrqvEcAaF/gii783F2Na8Kfw5wlwR+E12eZkuGmD4i/Q
	2R/QAP4tiQ+s+xzIU/1m1zM34UHpL3FYdZIpA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jDwaETMFYF9WvZrUSAyhHtvlol5g1pcpd1VxxMmxlchoaUBNM+TtBuScBLadedEliK
	iyy565CosjmlS5c4jqf0yCDL1EiEtySujW0Ttjeb7irSp+k5Wnor/gRRUVV+nkm9Moc2
	zeftpw8v5OSlBUbstqYw0q3+ie7X3tao7SFM4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.178.3 with SMTP id a3mr1393044anf.59.1244048511715; Wed, 
	03 Jun 2009 10:01:51 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.64.0906022113520.27204@juice.ott.cti.com>
References: <Pine.LNX.4.64.0906022113520.27204@juice.ott.cti.com>
Date: Wed, 3 Jun 2009 14:01:51 -0300
X-Google-Sender-Auth: 8a75e4ca3baf43a5
Message-ID: <be7a9f3d0906031001m3f2801a9sb0794a0d9d68dca5@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: busybox & syslog init script
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
X-List-Received-Date: Wed, 03 Jun 2009 17:10:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Tue, Jun 2, 2009 at 10:27 PM, Michael Smith <msmith@cbnco.com> wrote:
> 1) split the syslog initscript into busybox-syslog, as is already done for
> busybox-httpd and busybox-udhcpd;

I prefer this solution since it allows for more flexibilty; but
please, don't add it as dependency to busybox.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


