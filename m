Received: from [209.85.200.172] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LhX09-0007PU-NM
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 23:34:13 +0100
Received: by wf-out-1314.google.com with SMTP id 28so245643wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2009 15:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0opkquCaPxo4Y/eOwQoaS1gWlDG8beAm0LzvfzUWS7Q=;
	b=EhH/+l8xxbAEt4VYvRDnY1IeIvlSbWpBlu9A2qm1Kd74IN8Xjw3tHsWh57YwbRuawp
	Au9WhwoXPT2XP0bThU+XSY15BwCaLjCTNEjVZ76kk9DAl6cFMD28Hq5aHupig6Qpo+BX
	3RvAvlHDtkgCRI9h6giGn9KWebnFboTpr0EeA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wskIHrdSXJUuFOkPGhpAIUUW3rda1pirRvsg5+2vvnFG4hxanBjYgk81rWT2c0DtPq
	PK+LV6Rehb+r3aW9MpJ1gqb2BEQH0/hHyx2tgfKMztPUqvmL9jGhY0Y/urQWnhCtcGVd
	lw0ubL4ifY7SUCjE46zQliMPS2vzFW+oiJXf8=
MIME-Version: 1.0
Received: by 10.143.166.10 with SMTP id t10mr3913245wfo.210.1236810843949; 
	Wed, 11 Mar 2009 15:34:03 -0700 (PDT)
In-Reply-To: <1236790606.14496.4.camel@northpole>
References: <1236790606.14496.4.camel@northpole>
Date: Wed, 11 Mar 2009 15:34:03 -0700
Message-ID: <19c1b8a90903111534g39f25ba4ocd1f3a5099acf48b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: tinylogin not found
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
X-List-Received-Date: Wed, 11 Mar 2009 22:34:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Mar 11, 2009 at 9:56 AM, Jader <jader@2mi.com.br> wrote:
> Hello.
> I'm trying to compile minimal-image but I've got a tinylogin error.
> It seems tinylogin is deprecated, http://tinylogin.busybox.net/
> redirects to http://bugs.busybox.net/
>
> How can I disable it from build?

What distro are you compiling for ?
try bitbake -g and inspect the dependencies and find out why is it
being pulled in
it only shows up explicitly in task-mamona.bb

Furthermore tinylogin should be moved to obsoleted packages IMO

Thx
-Khem


