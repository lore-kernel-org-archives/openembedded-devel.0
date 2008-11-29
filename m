Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1L6SS8-0008Hk-K2
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Nov 2008 17:13:52 +0100
Received: by nf-out-0910.google.com with SMTP id d21so948807nfb.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2008 08:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:in-reply-to:references:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=k6A2mNKsM72tRNWrEbZkg1Ee9PO2WeU3U+O0Hxfrij0=;
	b=oFe9YH+t/4y5018KgS/b41mkY5noJQyq0jg6Y/SANh2fsbbTiGLeO8IV8Y5CjxwHTz
	N3cyUr9g9p2QFJPpwDy3EcoI/nbdE7rrRXuFcOITswOF+rLS6qy3XqgdXwYs91fc1e3Q
	WoI6RQOzJdUTA4LFxN72UoPpCTTamenT8wx0A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:in-reply-to:references:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	b=G7LwHjCCTKzG14Wpr3cT9BmQGGHsqrt4FvIXRlP8mmsaNrWqA7ljpZ1wLADkvapdIH
	o7fKr4QGm7Ii+E/KRn9qce+gl9pADdIjbveQTIioUkXqoz2fPXzbajQW5aywEgyYk0yT
	AEZvEBEMn9GxPdWpKhsb6s9y7bdK9zX5n7oeQ=
Received: by 10.103.175.9 with SMTP id c9mr3667576mup.3.1227975039629;
	Sat, 29 Nov 2008 08:10:39 -0800 (PST)
Received: from widy.localdomain (nat-users-50.is.ua [194.79.8.50])
	by mx.google.com with ESMTPS id u9sm2754254muf.4.2008.11.29.08.10.38
	(version=SSLv3 cipher=RC4-MD5); Sat, 29 Nov 2008 08:10:38 -0800 (PST)
Date: Sat, 29 Nov 2008 18:13:39 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081129181339.7152fdd4@widy.localdomain>
In-Reply-To: <ggq1n1$85a$1@ger.gmane.org>
References: <ggq1n1$85a$1@ger.gmane.org>
X-Mailer: Claws Mail 3.5.0 (GTK+ 2.12.11; i686-pc-linux-gnu)
Mime-Version: 1.0
Cc: dbaryshkov@gmail.com, openembedded-devel@openembedded.org
Subject: Re: packaging question
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
X-List-Received-Date: Sat, 29 Nov 2008 16:13:52 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 29 Nov 2008 00:17:37 +0000 (UTC)
Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:

> Hi,
> 
> To make suspend work on tosa w/o problems, I have to put several
> files into apm hooks directories. The question is: into which OE
> package should I put them?

This was discussed well once - please put all machine- and device-
specific hacks and workarounds into separate package(s), to not
contaminate the main device-independent package with them, which would
either cast the main package machine-specific (QA nightmare), or affect
other devices unexpectedly (even bigger QA nightmare). There're few
examples of this idea already, see apm-wifi-suspendfix,
bluez-dtl1-workaround packages.

If such a package is machine specific, it's obvious where it should go
- into MACHINE_EXTRA_RDEPENDS. If it's however a workaround for
a particular device, especially pluggable, it makes sense to make it
more flexible and automagical and associate with the corresponding
kernel driver. See kernel.bbclass for how the packages above are
handled.

> 
> -- 
> With best wishes
> Dmitry

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


