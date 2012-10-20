Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TPXqS-0000hO-2Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 14:08:00 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so896825pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2012 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=gyy2/XpyjuU4dgWHf2/FnRc2rzYUoCioyUT3rLdCsB8=;
	b=bUalAIq2WK185TaffH5qjgd6If54JR+ReI91ubIeprGNlu6ETcpYaMJ4T4QWqUBKe6
	wS7Pq5MRitY5z7+fum5WxwudKwkbtOD4nRhWT6uAOEJOQTCb7IItdaYuC4X4t/rvW5t2
	lnhKIUIpi8jrqoxJvrX72vNTi/wYqOnSGiBRFpJ3HA7NC3wk2/8yjzWAaSuiztv14KTU
	dfaQKytBp2nl2uSaZtjmdjylAnQis3nwAQxIuNw1XqQVn39dhbxAdQGFEH/c1E61CE++
	2e84C34r8bea0eHHwqkUWItsbe86Z59xDXjJ/O1lQRF4ZLDqJ99IaqpACufc1o6I7eSk
	Eh4g==
MIME-Version: 1.0
Received: by 10.68.135.168 with SMTP id pt8mr15197178pbb.24.1350734077410;
	Sat, 20 Oct 2012 04:54:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sat, 20 Oct 2012 04:54:37 -0700 (PDT)
In-Reply-To: <1350665204-7352-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1350665204-7352-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Sat, 20 Oct 2012 08:54:37 -0300
X-Google-Sender-Auth: 4N6rOXiUYtzhvS_lj3HtES5UBjM
Message-ID: <CAP9ODKoZgqVc--zoe4vupRL3QfVtYMv-jFvazUqAXiYWoX1J=A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hddtemp: add from OE-Classic and update
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
X-List-Received-Date: Sat, 20 Oct 2012 12:08:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 19, 2012 at 1:46 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> hddtemp is unmaintained upstream so we have to do a bit of patching. All
> patches sourced from Debian/Fedora, except hddtemp-no-nls-support.patch
> which came from OE-Classic.
>
> Other improvements:
> * Install initscript
> * Make LICENSE more accurate
> * Add LIC_FILES_CHKSUM
> * inherit gettext to avoid error during configure
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

I think some patches could be cleaned up. Specially the generated
files. Debian includes them in the patch and the packaging guide
advices to do it (there're reasons for it) but OE regenerated those so
I think it could be dropped.

Another thing, I remember to see this patch before on mailing list.
Did you forget to mark it as v2?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


