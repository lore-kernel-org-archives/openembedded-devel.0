Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwhoosier@gmail.com>) id 1IAv4A-00073d-L6
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2007 23:58:46 +0200
Received: by py-out-1112.google.com with SMTP id a25so3380785pyi
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2007 14:58:16 -0700 (PDT)
Received: by 10.65.239.14 with SMTP id q14mr1702745qbr.1184709496603;
	Tue, 17 Jul 2007 14:58:16 -0700 (PDT)
Received: by 10.65.154.18 with HTTP; Tue, 17 Jul 2007 14:58:16 -0700 (PDT)
Message-ID: <d543f5920707171458q3c13f402x16c8c8fb37f280ea@mail.gmail.com>
Date: Tue, 17 Jul 2007 16:58:16 -0500
From: "Matt Hoosier" <matt.hoosier@gmail.com>
Sender: mwhoosier@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <469D3681.3030004@klever.net>
MIME-Version: 1.0
References: <d543f5920707171347k2845264cgbce3c02d76818810@mail.gmail.com>
	<469D3681.3030004@klever.net>
X-Google-Sender-Auth: 7394e80fe28f1acb
Subject: Re: Building auxiliary tools in qmake2-native
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
X-List-Received-Date: Tue, 17 Jul 2007 21:58:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Michael,

On 7/17/07, Michael Krelin <hacker@klever.net> wrote:
> I'm not a qt expert and even less qtopia expert, but I happened to do a
> bit of work on qt in OE. That was both an excuse for my ignorance and
> the explanation of why the hell I find it appropriate to chime in all.
>
> I do not know what 'lrelease' is (ignorant, remember?), so I'd also ask
> if you really sure that, for instance, uicmoc is not a better place for
> the tool than qmake?
>

This is the tool which generates the final binary version of the
message catalogs. The equivalent for a libintl-based project would be
"msgfmt."

I had completely managed to overlook the presence of the uicmoc-native
packages. Let me give those a try before bothering anybody further
about this stuff.

> The other thing is that when building uicmoc with qt3support module OE
> has to build almost the whole qt, anyway. Would it not be better if we
> just have qt-native package with all the tools installed? That would
> reduce the amount of merciless and senseless patching and I believe
> would reduce the slice of disk-space/cpu-time continuum eaten up by most
> of the builds.

I'm pretty much agnostic about the breakdown of the particular
packages that end up providing the native tools used during target
builds.

Thanks


