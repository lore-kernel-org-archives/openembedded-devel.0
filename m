Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id EB3EE6E99A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 10:15:39 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id x13so12661314qcv.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 02:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=/EZe7NWxPrEx2cAWdzoL9Ww5/oWzlWM6WC4C3sSST6Q=;
	b=aTaCROE+iTkJRSTuOktx4wmCHGzPRFL9OOh5BfcoKee0okAN/rsui5Ki6ImVkgNWbm
	5WsCCTBYLmCATulRGxekHporlj2/UuT1BfCjgyeqFIkN0qA2TkTZ/t2g67RksCNNcwFj
	YZjMxO3uEFNVgJBH3KZLwFgZ5mmMFSo//3W91T2MIMe1G293beyUsEJM1iQo51V57aRU
	in7lqhA+xok7lYzsAwDfoqrJeeqwJ7hNS9Tmwah64dv/Wgs1Lb76cQbFPRW2lKGY0XXL
	PWOmTZi9MEnbDavLxVfnK6t/0zgd9XkEpH5GhYgZQ7HnfTclAVyJIV6vWiTLm5Vx74f4
	plLA==
X-Received: by 10.140.91.198 with SMTP id z64mr2285330qgd.32.1392113740369;
	Tue, 11 Feb 2014 02:15:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 02:15:19 -0800 (PST)
In-Reply-To: <FC0A8257-46FF-46AD-8061-AD3396E8B243@gmail.com>
References: <CANx9H-DMjo0JaHyGqgxh31wX77Z_OmpjF=cgAayLKyYcKLenxw@mail.gmail.com>
	<FC0A8257-46FF-46AD-8061-AD3396E8B243@gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 08:15:19 -0200
Message-ID: <CAMCfZKH74FMry8-LvajWMEMbx0fEF2OzmZV+iDCkZ6djUCXsrA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: xbmc build failing
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
X-List-Received-Date: Tue, 11 Feb 2014 10:15:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 2:10 AM, Khem Raj <raj.khem@gmail.com> wrote:

> seems like its not including proper headers may be you need to include
> unistd.h
>

Not sure about this. The strange thing is: When using poky as DISTRO this
error is raised, but when using Angstrom instead, the error isn't raised.
Could it be related to eglibc version? How can I check which version is
used on both distros?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

