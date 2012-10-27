Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TS9DE-00084R-QI
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2012 18:26:17 +0200
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 27 Oct 2012 09:12:32 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so11468695obb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2012 09:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=nmvKh1OzuoJNu9Xs4eD5290VsKIWbl7eIzzsWxkl7q8=;
	b=LAXedQWSCntGmcHr3dyj72wBnSZ3V8suyOMPTpA3lqo8qSz/eBIeKtB4BzjkCtaMTy
	nyPg0XX9D8yP46fILY5aAeWlzKWrJSOj+NKOVfghD3oSBFRDidDV7eLJXo/Xv3X6pzAa
	ZgzWO25pcfWpEXyWw3SOoamXiY2HvuCkfJV7IvhZQm+cT6baNspzz8mJUH97n5dR0Oqk
	04I/3bsxaFQSQXJz1ukRD8bjRErYiReWkabeVaja1dZcKkbCkqJz+EuEgoGubLD5EuXy
	lXaAIeIT5JbNv1cHc3aFKW8Ok+NYRwYPkZW02p3X99JRJ1bwDcGZEjqt0CznAGmQ4C3+
	qwew==
Received: by 10.182.177.72 with SMTP id co8mr21295347obc.53.1351353935738;
	Sat, 27 Oct 2012 09:05:35 -0700 (PDT)
Received: by 10.182.177.72 with SMTP id co8mr21295343obc.53.1351353935661;
	Sat, 27 Oct 2012 09:05:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Sat, 27 Oct 2012 09:05:15 -0700 (PDT)
In-Reply-To: <508AADE4.2010409@gmail.com>
References: <1351241920-15135-1-git-send-email-martiert@gmail.com>
	<1351241920-15135-2-git-send-email-martiert@gmail.com>
	<lybofpuwri.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaxgdhkxtWRgpZ2-QY857myw-ZpdrDpi3kyxkfxQWfGvg@mail.gmail.com>
	<508AADE4.2010409@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 27 Oct 2012 17:05:15 +0100
Message-ID: <CAJTo0La_XkU=EaNYWo+275k_58qqmVyvhhN5e1sZh0dMtTemfQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnKZSUou4qWfoaBHXfvyuLdjsSRbyEl1wTbhxYaVFppM+mLIcYhB2kNYH/oEDnOqSez5SbRUKPPKgno4AJMKf15iVg25gEUUSdt62rU0Td/69brQ+zAOxfM8rcUMpt55qDbrpUUj7WECJo4VvG0WMijbPWPlinTPnvWj+XJphuTRQo5ktMQnPXFDNfquSQSez4qJIix
Subject: Re: [meta-systemd][PATCH v2 2/2] meta-systemd: ntp: Fix starting of ntpdate.service
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
X-List-Received-Date: Sat, 27 Oct 2012 16:26:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 October 2012 16:36, Martin Erts=C3=A5s <martiert@gmail.com> wrote:
> Should we leave this until someone registers a pool, or what would be a g=
ood
> default pool until someone does it?

This should be raised with the TSC.  There isn't a good default pool,
if you use pool.ntp.org as a default you are in breach of their terms.

Ross


