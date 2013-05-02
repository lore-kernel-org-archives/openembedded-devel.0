Received: from mail-ve0-f177.google.com ([209.85.128.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXvEt-0002Xs-Nj
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 17:16:08 +0200
Received: by mail-ve0-f177.google.com with SMTP id jw11so575023veb.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2013 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=d60siqYci5I6BhAP2jUgjFRUXmFc3r0d1LRSavgF1PA=;
	b=iJddOBxVcGNxJZwKMRk8Vd9LzXZ/epL+JYmHz4lrkQtrm6OGsYsrIk6cO5qtvSUSqR
	9qsk7Gdnbb9GFWfvrVHnxLTDAuV0zl40zJgRG91X2USz2Ur6HJRBBDs6lQs1ORVutxbm
	nTVrt7qH+WYTwYXTLWbbX8xoEyar9SPhq/4yxiMDwDaNpVUA66CCAuQHn9035z//6Zwn
	o4bBHVG0VWgt4WxM/kz4nvWjR05BuEL3kS14kakRVynOk5Tb3Rhg57AXw0BC0KSy+TDa
	TWLnHWiS/Nl0o0tytXUkxVP6xJEhyzwk9MAXRYBKtzZzQcvHuiyb1woRlwKCvEc+POHT
	lIyg==
MIME-Version: 1.0
X-Received: by 10.220.77.2 with SMTP id e2mr2263418vck.63.1367506693570; Thu,
	02 May 2013 07:58:13 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 07:58:13 -0700 (PDT)
In-Reply-To: <CALbNGRQ63OrcZY9i-qvc0ERzGTsnTMiY101dAgr7keNBVDrpWQ@mail.gmail.com>
References: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
	<1367087640-4264-2-git-send-email-schnitzeltony@googlemail.com>
	<20130427193111.GF3199@jama>
	<CALbNGRSZ-H-+0yZuf4uvYbLEqXdUzTuMLXMhc63BtrZPieYyLA@mail.gmail.com>
	<CALbNGRQ63OrcZY9i-qvc0ERzGTsnTMiY101dAgr7keNBVDrpWQ@mail.gmail.com>
Date: Thu, 2 May 2013 16:58:13 +0200
Message-ID: <CALbNGRSXsNgFksmktPkCq85O6dN+2R-RbZDk_R0CcqgxF8ytbw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome/meta-xfce 1/4] gdm: fix postinst-code to unbreak first boot issues
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
X-List-Received-Date: Thu, 02 May 2013 15:16:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2013 at 4:48 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Apr 29, 2013 at 9:33 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Sat, Apr 27, 2013 at 9:31 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>>> On Sat, Apr 27, 2013 at 08:33:57PM +0200, Andreas M=C3=BCller wrote:
>>>> Exiting postinst code leaves systemd.bbclass offline postinst code une=
xecuted,
>>>> causes postinst not to finish at first boot (gdm.service is not aliase=
d to
>>>> display-manager.service -> started much too early) and is not neccesar=
y:
>>>> language preparation can be done offline.
> Just learned that the chown code does not belong to do_install. Shall
> I send a V2 or a follow up?
I was too fast - it still discussed [1]

Andreas

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-May/039111.=
html


