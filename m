Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Kn81O-0002OJ-KU
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 10:34:22 +0200
Received: by an-out-0708.google.com with SMTP id b38so166627ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Oct 2008 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=Ih/HnMVrlV5bXuEq5Fx2jkfSeINo9sxBSL85IaUtNrQ=;
	b=nsVbhP2+Ea4bJz9SvUP+WEYuE6VjYv/tJQbjHsYoeMIlEIwawU6sXW9xlFE9eBO8Es
	xg44ytYtJoziguicGM1SEt7jurTgYpKWbY5yl3upX9zbQro5RzoX3jyiBueXhJUS/Xmm
	EduGOiyJJA+ISbFbMlD4euXNvGkgfQ5YFf/h8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=Wantwl2tksPGmiQgC19EG6FgvasLuMGqCNch0MZ7M0F51hJL/c0vqAh4xvbpnu8eY9
	zT3uq18MGdUalQcFk0xFA7xU1GztYAYseyCJ6bkW3KZqMDrmdb+s5WS+BWPYbFc9uB1l
	Q3EWkOTDRkSTtqgMfT/yfz0Zu/GyWF6cDYRXI=
Received: by 10.100.10.11 with SMTP id 11mr6208498anj.53.1223368189620;
	Tue, 07 Oct 2008 01:29:49 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Tue, 7 Oct 2008 01:29:49 -0700 (PDT)
Message-ID: <c384c5ea0810070129l10a9913dk9ef5d5239ad45132@mail.gmail.com>
Date: Tue, 7 Oct 2008 10:29:49 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0810061601l382428a3rc8efc6c10fd928ca@mail.gmail.com>
MIME-Version: 1.0
References: <gc35ba$voi$1@ger.gmane.org>
	<c384c5ea0810061210l65b4178ay812a9681a4e86dda@mail.gmail.com>
	<gcdokp$evo$1@ger.gmane.org> <gcdpfj$hr0$1@ger.gmane.org>
	<c384c5ea0810061601l382428a3rc8efc6c10fd928ca@mail.gmail.com>
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Tue, 07 Oct 2008 08:34:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Koen,

On Tue, Oct 7, 2008 at 1:01 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> On Mon, Oct 6, 2008 at 9:38 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> I suspect packaged-staging is using the old staging packages (as can be seen
>
> Maybe this project is misconfigured, thanks for the heads-up on the
> setscene step.
>
Affirmed. I had the packaged staging deployment dir overriden to exist
outside TMPDIR.

Sorry for the fuzz, thanks for the patch!

Regards,
-- 
Leon


