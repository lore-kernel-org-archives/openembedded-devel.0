Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF6B65E3D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:09:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Aug 2014 02:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,840,1400050800"; d="scan'208";a="556763016"
Received: from glucy-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.202])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2014 02:08:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Mon, 11 Aug 2014 10:08:34 +0100
Message-ID: <1544415.MBbs8JpE6c@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CABcZANnn4CSDe4Gvc+nuM39u9dQK74zuLnzw8Uf6sKfDp5v2Gw@mail.gmail.com>
References: <017701cfaf7e$77e1a390$67a4eab0$@lge.com>
	<01b401cfaf9f$14258da0$3c70a8e0$@lge.com>
	<CABcZANnn4CSDe4Gvc+nuM39u9dQK74zuLnzw8Uf6sKfDp5v2Gw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: How to apply "-Wl,--build-id" in all recipes?
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
X-List-Received-Date: Mon, 11 Aug 2014 09:09:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chris,

On Saturday 09 August 2014 11:22:11 Christopher Larson wrote:
> On Sun, Aug 3, 2014 at 9:46 PM, Changhyeok Bae <changhyeok.bae@lge.com>
> wrote:
> > As I said, I applied the variable in local.conf.
> > The LDFLAGS env. variable is included '-Wl,--build-id'.
> > However, the variable is not applied at the linking time.
> 
> All recipes *should* ensure that the buildsystem of what they're building
> obeys our LDFLAGS, but plenty do not. We used to spot these cases via the
> GNU_HASH warnings, but now we build the internal toolchain with the default
> gnu hash so cases where LDFLAGS isn't being obeyed are slightly more
> difficult to detect unless you'er building with an external toolchain.

Hmm, when did this change? I was sure we still got this warning if the OE 
LDFLAGS weren't used...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

