Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JPglr-00058I-6U
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2008 17:17:11 +0100
Received: by nf-out-0910.google.com with SMTP id h3so267043nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2008 08:17:02 -0800 (PST)
Received: by 10.82.112.3 with SMTP id k3mr2768371buc.15.1203005821400;
	Thu, 14 Feb 2008 08:17:01 -0800 (PST)
Received: by 10.82.118.18 with HTTP; Thu, 14 Feb 2008 08:17:01 -0800 (PST)
Message-ID: <74d0deb30802140817g153c4fe3if16cd9eabe67c9f3@mail.gmail.com>
Date: Thu, 14 Feb 2008 17:17:01 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1JPfb1-0006hO-Ll@linuxtogo.org>
MIME-Version: 1.0
References: <E1JPfb1-0006hO-Ll@linuxtogo.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev anki: fix parse error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2008 16:17:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Feb 14, 2008 at 4:01 PM, hrw commit
<openembedded-commits@lists.openembedded.org> wrote:
> anki: fix parse error
>
>  Author: hrw@openembedded.org
>  Branch: org.openembedded.dev
>  Revision: a33b3d19ac330b59af9dbbb80b1410d4579bba26
>  ViewMTN: http://monotone.openembedded.org/revision/info/a33b3d19ac330b59af9dbbb80b1410d4579bba26
>  Files:
>  1
>  packages/anki/anki_0.4.3.bb
>  Diffs:
>
>  #
>  # mt diff -r75f2dc6b3a783a084bf013ce7dc072992561a9bd -ra33b3d19ac330b59af9dbbb80b1410d4579bba26
>  #
>  #
>  #
>  # patch "packages/anki/anki_0.4.3.bb"
>  #  from [bbc71d5b420649c30e0f4e7ca986a9f3516be13e]
>  #    to [de5cc8560fa7d2401299249253867146486bcf24]
>  #
>  ============================================================
>  --- packages/anki/anki_0.4.3.bb bbc71d5b420649c30e0f4e7ca986a9f3516be13e
>  +++ packages/anki/anki_0.4.3.bb de5cc8560fa7d2401299249253867146486bcf24
>  @@ -1,9 +1,9 @@ PR = "r0"
>   require anki.inc
>
>   RDEPENDS += "libanki"
>   PR = "r0"
>
>  -export PV
>  +export PV="${PV}"

ERROR: variable PV references itself!

rolling that patch back fixes this bitbake parsing error for me (I
didn't try to build anki)

regards
Philipp


