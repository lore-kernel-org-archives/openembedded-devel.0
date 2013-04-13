Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UR6ue-0007Iz-Ks
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 22:19:08 +0200
Received: by mail-oa0-f43.google.com with SMTP id l10so3453519oag.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 13:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=AOhSWa9hY0Ex22KKa+EhWBCuT0i8Jjm5Sj9UZV7hTVQ=;
	b=eYSPrGDEZxuiEXykIAd8NjoG4fNhyhbFm9wxcmizA0AYfn+t2k5dmmz3ctNhqQBt2x
	Jv3h9rX5BaDrrhh4NC30UIk3CQvRGotZP0PaZrxmnwsTjSXJ21NFgR0iPu9L8IQuIUOp
	I7W6HYHpgog/MNPg19Ye/+GpWqnaPpN+YWLho0ucegi0pvAWjvT14pojv8Hmdprc+4XE
	P5D42BL/ZrlZe1t42iVbHcRr2iVBycQcpbirGhY7ZD6meE8VIn7vz4HaH0RZeChbniXU
	OByIO8wwPUHhBJMpc5diMwYZrIEOm6vptNwluyeTvr84WZzIpSCetnOF4gyyMWvt1eIb
	6wiw==
MIME-Version: 1.0
X-Received: by 10.182.131.168 with SMTP id on8mr1568206obb.7.1365883297789;
	Sat, 13 Apr 2013 13:01:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 13 Apr 2013 13:01:37 -0700 (PDT)
In-Reply-To: <20130413134648.GE2477@jama>
References: <20130413134648.GE2477@jama>
Date: Sat, 13 Apr 2013 17:01:37 -0300
X-Google-Sender-Auth: Wst7kalfhfqJl5X9O39fs-qgg2I
Message-ID: <CAP9ODKrDsqRJORkzjACf4=9ffu_STKFzFNUSBQyfwF_VuTKSFw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Consistent indentation in meta-openembedded metadata
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
X-List-Received-Date: Sat, 13 Apr 2013 20:19:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Apr 13, 2013 at 10:46 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi,
>
> maybe you remember my proposal to make whitespace consistent for python
> and shell tasks a while back:
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026176.html
>
>     * This change is only aesthetic (unlike indentation in Python
>     * tasks).
>     * Some recipes were using tabs.
>     * Some were using 8 spaces.
>     * Some were using mix or different number of spaces.
>     * Make them consistently use 4 spaces everywhere.
>     * Yocto styleguide advises to use tabs (but the only reason to keep
>       tabs is the need to update a lot of recipes). Lately this advice
>       was also merged into the styleguide on the OE wiki.
>     * Using 4 spaces in both types of tasks is better because it's less
>       error prone when someone is not sure if e.g.
>       do_generate_toolchain_file() is Python or shell task and also allows
>       to highlight every tab used in .bb, .inc, .bbappend, .bbclass as
>       potentially bad (shouldn't be used for indenting of multiline
>       variable assignments and cannot be used for Python tasks).
>
> I still have some scripts for semi-automatic conversion.
>
> Now close to creating dylan branch for meta-openembedded is imho best
> time to do this, not many changes from released dylan will be backported
> to danny, because people will start moving to newer release instead of
> backporting more and more stuff to old one (also resolving possible
> whitespace merge conflict it not hard). Causing conflicts for merge was
> IIRC most important reason why my proposal was rejected for oe-core.
>
> meta-efl, meta-webos(-ports), meta-smartphone layers are already using
> it for some time and meta-openembedded recipes are using spaces in shell
> tasks in majority of recipes.
>
> If nobody objects I'll run my scripts after all pending patches are
> merged.

I fully agree; it is currently a mix in a lot of place so it is going
to make it way better.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


