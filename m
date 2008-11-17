Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ainulindale@gmail.com>) id 1L268g-0004fr-MP
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 16:35:46 +0100
Received: by yx-out-1718.google.com with SMTP id 4so1074064yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2008 07:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=AYDP5SDvuYtgd0zguZKMNl4sMmhLFqqZiilK3fJnf28=;
	b=gUj3BUkKFkj144qBbcKEABMTdwwPuubwl8nO7A3m43wRT10YQhJOb1jRQeitTOa5rA
	J8w4H8qm4zQ1bTb8ArJlFUHReokb8UUnPcN03SKO9WYEdV/9M2FImvLHpkZ8CP24+jTs
	VKVyyZCD/vJbY4p3em71X8BUyXgAymLDFrjEQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=TXvEJsj5xh5Y5ZEvQU2ukFesoDABf4gQSeBjG8tR0gyE43hgU5Gbc4JS+sh1tt3TR6
	G5tskekAU2lmoR5lEVZSxcFup8bsWCXojDavXwtiH9erzaWjV5BeCqV1DCyaE6kznKwx
	aUerNptgH/oo+glhlgJpg72sjBGKB9xoH7u2s=
Received: by 10.90.118.8 with SMTP id q8mr2760206agc.67.1226936005724;
	Mon, 17 Nov 2008 07:33:25 -0800 (PST)
Received: by 10.90.95.19 with HTTP; Mon, 17 Nov 2008 07:33:25 -0800 (PST)
Message-ID: <76a8cde90811170733v7207ee89ucc5e9195fc4979c7@mail.gmail.com>
Date: Mon, 17 Nov 2008 16:33:25 +0100
From: "Julien Cassignol" <ainulindale@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081117151909.GG11401@datenfreihafen.org>
MIME-Version: 1.0
References: <20081117151909.GG11401@datenfreihafen.org>
Subject: Re: Moving fontconfig cache out of tmpfs
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
X-List-Received-Date: Mon, 17 Nov 2008 15:35:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Nov 17, 2008 at 4:19 PM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:

> What do people think about pointing this to something not mounted as tmpfs? Any
> problems I'm not aware of?

As I just told Stefan, we already applied this tiny hack to SHR
postrootfs (even if I'd like to do that any other "proper" way), and
it's quite handy.

-- 
Julien Cassignol
http://www.ainulindale.net


