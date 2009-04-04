Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lq9zH-0002gI-K4
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 19:49:01 +0200
Received: by an-out-0708.google.com with SMTP id d11so1428546and.30
	for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 10:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=uueAv0RWAhWuCeMLFLjQGdArOpMaQbH5QtJRm+DWJ2g=;
	b=OFuSaMon7IkiFTdshN22TEp01MeqYG94eaMim2xQtA8k66e8ZrHbt+Cm46wEo8jVSE
	gozlpftPzOGBebnroEl7ZaRbHcl0Jtve+ISFv6PfUfzGwV7qJK6A1TrICzz7T1vFYCMZ
	w+m4Ha6OJUXjZgrWzSyaZe6jQE6w2AjogzgIY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=F9GWgLAixZTCEeQmJRV4ZgDcbMHHqV5mv82NOKCZFKCKZiu4ukeTcQqh6CNJOsGs15
	iGN+h9xJw9AgMGYfPSp68Kk+63k9kJ/xH5zPNwF4HYQ5V/oNUPNPI5rAFPIi65QQlOoO
	STMMbb1+U0RbX8nb5GRQ/S6ejgjZVcOvsji28=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.132.14 with SMTP id f14mr3729875and.94.1238867180663; Sat, 
	04 Apr 2009 10:46:20 -0700 (PDT)
In-Reply-To: <gr7nfd$32a$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
Date: Sat, 4 Apr 2009 14:46:20 -0300
X-Google-Sender-Auth: 0433b914a3e635c5
Message-ID: <be7a9f3d0904041046n65089397g5b82ccab0aec2afb@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.242
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Sat, 04 Apr 2009 17:49:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Sat, Apr 4, 2009 at 10:31 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Hi,
[...]
> I don't really like this method, but I'm having a hard time coming up with a
> decent solution that:
[...]

I agree that is not beauty but it works.

I also belive it could be used in other recipes too as initramfs-images. This
way forcing the rebuild of it if the kernel is changed and machine revision
is bumped.

Fully support it.

+1

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


