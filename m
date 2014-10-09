Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7C92365D58
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Oct 2014 22:03:55 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id t59so1188404yho.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Oct 2014 15:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=apEh7tj2IQU22zrGOCv0dgTpf5m8bqqt+Y93FP6hrJY=;
	b=oAYB9CyRv/uGeAH5lOzB/ybvlUa9JFPYf96ENIJOX9nzgDUOx2t82GZiQZnvxVSODg
	JJrLm79lWt36bEmJ1mR6cvJWuaL26JRCclZnfEeJK0eA8FIBfe87h33EtJKV//0sk9Zq
	2JK/j6y5vJ7Bk9palA74b0ECdglLVof16nvaBWWXq0kD+64F460peXpEE+cDr/KHq+mD
	z+WSQsaCf1z2ctHYjzLME2jSC8JfbMIAZGpCGdzDNU28uWfDUwCqzMfJG5//YnLl4LQj
	QUVxbh1DmTA+O5c8KXIYpEIaTSAbtoodGWwzhLc8QC0yTTgeXPi/t7xxtoBZW9pDle0A
	XLuA==
MIME-Version: 1.0
X-Received: by 10.236.75.99 with SMTP id y63mr1143603yhd.105.1412892236956;
	Thu, 09 Oct 2014 15:03:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.70 with HTTP; Thu, 9 Oct 2014 15:03:56 -0700 (PDT)
In-Reply-To: <1412793992-29793-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1412793992-29793-1-git-send-email-eric.nelson@boundarydevices.com>
Date: Thu, 9 Oct 2014 19:03:56 -0300
X-Google-Sender-Auth: 8jaDOR3jemRGT0F7mIu_cL9wDTU
Message-ID: <CAP9ODKr2wzP-=5LvEMKvxcPtD-gA-DVUHrfdWtAKmLpHz81t3Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Eric Nelson <eric.nelson@boundarydevices.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH][resend] chromium: conditionally compile routines for use with GLIB
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
X-List-Received-Date: Thu, 09 Oct 2014 22:04:02 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 8, 2014 at 3:46 PM, Eric Nelson
<eric.nelson@boundarydevices.com> wrote:
> The routine QuoteArgForDesktopFileExec is only called when GLIB is
> used, and compilation will fail with the following error message
> if it is compiled without GLIB support (e.g. under Wayland):
>         "defined but not used [-Werror=unused-function]"
>
> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>

I applied this on master; thanks for sending it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

