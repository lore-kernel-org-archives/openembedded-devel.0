Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5A26FE5C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 20:08:24 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id 10so1841276lbg.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=Cy5TEuMKZFsuykOVEgxPRzZeGdba8HTuxXnEf72fu3w=;
	b=Jc2/rpe+/Ue/4wGZFxvzeXa/oSVDjkWAtYsWByIZWA0EDGeF6szUStuUFI0jv9DnW0
	vFJ1gQzmKw79q4EbXK2spH4JJGjbbndMb8hm/0o6Q7COOVp5iB/K+hy4DuF1dZNOBQ+m
	/KTnSJgdV/+SrWGNEAelaACfe/FoBeoyOsXR/PpinlGBziSKszjZCOQJJLIaSkyDVAHT
	4ZCV/2h/L0Rov7WbrbJiIu46rbz8oEmvsBU07ZttN362yefrUmsygnVsl6ZY2DVxkFAr
	860yL+4RG65ItR1x9AEbm+rZsGCtTjgT6AaAlw6z5bB/C0fH1izJa74Cwq+iN2UTEJZO
	Feaw==
X-Received: by 10.112.241.74 with SMTP id wg10mr5396036lbc.3.1405195705520;
	Sat, 12 Jul 2014 13:08:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.168.66 with HTTP; Sat, 12 Jul 2014 13:08:05 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407120720110.19807@localhost>
References: <alpine.LFD.2.11.1407120720110.19807@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 12 Jul 2014 13:08:05 -0700
X-Google-Sender-Auth: GGpgCzI-ggyGBSF4st8RCVGd9qA
Message-ID: <CABcZANkY6NJLP=YVJj1YM5LJ89MUtENCV9PMwKa2CKhr_NzmgQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: is it "addtask do_X ..." or "addtask X ..." or does it matter?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Jul 2014 20:08:30 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 12, 2014 at 4:22 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   want to clarify the two different ways to use addtask.  for example:
>
> classes/kernel.bbclass:addtask savedefconfig after do_configure
> classes/kernel.bbclass:addtask do_strip before do_sizecheck after
> do_kernel_link_vmlinux
> classes/kernel.bbclass:addtask sizecheck before do_install after do_strip
>
> so what is the preferred form? are they equivalent?
>

addtask do_strip will add a task named 'do_do_strip', afaik.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

