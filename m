Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 82DF86C0ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 19:53:34 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 7988B2803B8; Wed, 11 Dec 2019 11:57:12 -0800 (PST)
Date: Wed, 11 Dec 2019 11:57:12 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191211195712.d5hwlgm3ppfy4aqj@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@intel.com>,
	openembedded-devel@lists.openembedded.org
References: <CANSQD5+CcEbaHxdfR8cjqdc6maXhrCgXy3eXrGD0dMgpiM_0LQ@mail.gmail.com>
	<7e5b400c-9c07-ff0d-df4b-9ca0329bfdbc@intel.com>
	<CANSQD5+e24bohovGjVgagiFrizqu2sj0SwzJWn+17tUJCthO_Q@mail.gmail.com>
	<CAHtQpK4zNtju4Own7yx+bTZsmyycW2dXoB0JOA=566X=h89wMw@mail.gmail.com>
	<20191210205704.wkwzy2kpgq2nqam2@vctlabs.com>
	<CANSQD5Ju4ZN7gW7GGm6ELdG63LQDAe-gbn1aFXK4oO1Ta5NhZQ@mail.gmail.com>
	<CAMKF1sqnj-iczhgfww+J6=3pWKf6KLn4UWkuSz9cAhQCSqwmcg@mail.gmail.com>
	<721294ef-b4ea-ab49-19d0-82bfc8fff9b8@intel.com>
	<CAMKF1sq45JgRZ761Bpkc7GS8od4Lf-_OfudiCoZUJE2ch+Ogxg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq45JgRZ761Bpkc7GS8od4Lf-_OfudiCoZUJE2ch+Ogxg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Building Linux Error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Dec 2019 19:53:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Dec 11, 2019 at 11:42:59AM -0800, Khem Raj wrote:
> On Wed, Dec 11, 2019 at 11:00 AM Ross Burton <ross.burton@intel.com> wrote:
> 
> > On 10/12/2019 23:50, Khem Raj wrote:
> > > On Tue, Dec 10, 2019 at 12:57 PM Kamel Ghalgaoui
> > > <kamelghalgaoui7@gmail.com> wrote:
> > >>
> > >> For information, I my kernel version is 5.3.11 and I have tar version:
> > 1.26
> > >> $ which tar
> > >> /usr/local/bin/tar
> > >>
> > >
> > > Interesting. I wonder if we should poison /usr/local for hosttools.
> >
> > Probably not a great idea, as people may be installing stuff in
> > /usr/local *because* their /usr is old.
> 
> 
> That means we are letting the default tested distro information not convey
> what it means. Perhaps it’s. Better to blacklist it and then let users
> enable it explicitly so they know what they are doing
> 
> Otherwise these kind of issues will always keep coming up where an tested
> distro with local overrides will do unexplained stuff

That's what I was thinking -- allow /usr/local to be un-blacklisted by advanced
users as needed; novice users should be highly encouraged to start with 
something supported as build system.

