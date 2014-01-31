Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0791A6E987
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 17:35:58 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id w8so6545107qac.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=U/FAWshlxvRF142eDOGQ+JZrHedPqwoL/rAPqNbFTqw=;
	b=zUPI0jcoN96QbYReAZ0U5JQa0r4xbTFFlXaSoXZE7gfJi7bNuWN1Fs7thhN3WkdvrX
	p4LrZObVaP+34DBJFifqrEmYWC8LvdIQKLoLO05db9CtpKz/TOWJVfrZgONqO7FQ6ioi
	VinX0+ncT09Pihak4ktlMkD8BPscTwzSqqwGUAVR22HAjOftmZs2k3kDDAsyj8WOmDOF
	viuU6O1cQoXMfxnCT7VFYmRrYvXNC0sr4P1wQIoBpbHjd+TOGEurXhyI9gJkSLVogXXX
	E8jPehwPrCFAZsg4QQtghGLLfI1WRzqMh0GHdDLHdqPtSoBFwojxa+oT06Lpx5RDsS9y
	QGMQ==
X-Received: by 10.229.179.69 with SMTP id bp5mr33613445qcb.17.1391189759610;
	Fri, 31 Jan 2014 09:35:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Fri, 31 Jan 2014 09:35:39 -0800 (PST)
In-Reply-To: <CAP9ODKp_JRLSYgh_LrUjtsUkG9_FLibNbmYuoa-gPRkVxyLxqg@mail.gmail.com>
References: <CAMCfZKEwQWimV0j8FE1Z1KVW=xUCZgR36_Li1fNuiZfwYm7yrA@mail.gmail.com>
	<CAP9ODKp_JRLSYgh_LrUjtsUkG9_FLibNbmYuoa-gPRkVxyLxqg@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Fri, 31 Jan 2014 15:35:39 -0200
Message-ID: <CAMCfZKFg-39ZX0hpWxbYLQSz0eo-6NW9This3Kcg6D600-w9Yg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Systemd journald (206) storage issue
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
X-List-Received-Date: Fri, 31 Jan 2014 17:35:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 29, 2014 at 6:26 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> Please isolate the patch which fixes the issue in 208 so we can
> backport it to the Dora version.
>

Otavio,
I found this bug on systemd project:
Bug 68161 - journalctl ignored disk space restrictions
https://bugs.freedesktop.org/show_bug.cgi?id=68161

And applied these patches:
http://cgit.freedesktop.org/systemd/systemd/commit/?id=629bfc5a
http://cgit.freedesktop.org/systemd/systemd/commit/?id=48979861

I tested and it solved the issue.

Should I have to send these patches and the modified recipe to ML?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

