Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <papercrane@gmail.com>) id 1GORnh-0005VD-SR
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Sep 2006 06:29:10 +0200
Received: by py-out-1112.google.com with SMTP id i75so4031556pye
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2006 21:25:22 -0700 (PDT)
Received: by 10.35.18.3 with SMTP id v3mr18729729pyi;
	Fri, 15 Sep 2006 21:25:22 -0700 (PDT)
Received: by 10.35.119.19 with HTTP; Fri, 15 Sep 2006 21:25:22 -0700 (PDT)
Message-ID: <432beae0609152125r35136b2fv408e710704a8a4c8@mail.gmail.com>
Date: Fri, 15 Sep 2006 21:25:22 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1GMhrf-0002WF-E9@linuxtogo.org>
MIME-Version: 1.0
References: <E1GMhrf-0002WF-E9@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev uclibc.inc: allow EABI uclibc builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Sep 2006 04:29:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/11/06, koen commit <openembedded-commits@lists.openembedded.org> wrote:
> uclibc.inc: allow EABI uclibc builds
>
> Author: koen@openembedded.org
> Branch: org.openembedded.dev
> Revision: ff6f66dceec5bbb396856d2556a977d4b646133e
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=ff6f66dceec5bbb396856d2556a977d4b646133e
> Files:
> 1
> packages/uclibc/uclibc.inc
> Diffs:
>
> #
> # mt diff -r249c870178059ac049fdc94d1fcde51bef64c82f -rff6f66dceec5bbb396856d2556a977d4b646133e
> #
> #
> #
> # patch "packages/uclibc/uclibc.inc"
> #  from [d3b4db2b20b54cff2f4ae3c48eaf7aa4efc444fc]
> #    to [1a72fe185fb5b708ab4ff019b342ac4da284ece5]
> #
> ============================================================
> --- packages/uclibc/uclibc.inc  d3b4db2b20b54cff2f4ae3c48eaf7aa4efc444fc
> +++ packages/uclibc/uclibc.inc  1a72fe185fb5b708ab4ff019b342ac4da284ece5
> @@ -14,7 +14,7 @@ python __anonymous () {
>
>  python __anonymous () {
>      import bb, re
> -    uc_os = (re.match('.*uclibc$', bb.data.getVar('TARGET_OS', d, 1)) != None)
> +    uc_os = (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, 1)) != None)

"c*" seems a bit strange here....should it be "c.*" or am I
mis-reading this regex dialect?

-- 
Justin Patrin


