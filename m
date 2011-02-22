Received: from 2.26.mail-out.ovh.net ([178.33.107.8] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Prp9V-0000uE-Sx
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 11:07:29 +0100
Received: (qmail 5918 invoked by uid 503); 22 Feb 2011 07:47:03 -0000
Received: from b9.ovh.net (HELO mail425.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 22 Feb 2011 07:47:03 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Feb 2011 10:19:29 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 22 Feb 2011 10:19:27 +0200
Message-ID: <4D63718E.2090404@eukrea.com>
Date: Tue, 22 Feb 2011 09:19:26 +0100
From: Eric Benard <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298116419-18277-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1298116419-18277-1-git-send-email-schnitzeltony@gmx.de>
X-Ovh-Tracer-Id: 8182759048187260233
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] cross.bbclass: Fix many QA RPATH errors for distros preferring libtool-2.2
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
X-List-Received-Date: Tue, 22 Feb 2011 10:07:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 19/02/2011 12:53, Andreas Mueller wrote:
> * This patch removes the absolute path in sysroots/<arch>/usr/lib/libstdc++.la
> *
> * It was build tested wih clean tmp for xfce46-image. Additional known
> * QA-RPATH-error-candidates were checked for successful build:
> *
> * aspell-0.60.6-r0
> * curl-7.21.2-r4.0
> * clutter-box2d-0.10.0-r2.0+git4e72b9c135a9439b82d801c62422531db611f98b
> * enchant-1.6.0-r2
> * gnome-vfs-2.24.1-r3
> * libcdio-0.82-r3.0
> * libsoup-2.2.100-r1:
> * neon-0.25.5-r4
> * schroedinger-1.0.9-r0
> * tiff-3.9.4+4.0.0beta6-r0
> *
> * Build environment was (RPATH QA errors treated as fatal / acl fixed manually)
> *
> * BB_VERSION        = "1.10.2"
> * METADATA_BRANCH   = "cross-bbclass-test"
> * METADATA_REVISION = "a44300e"
> * TARGET_ARCH       = "arm"
> * TARGET_OS         = "linux-gnueabi"
> * MACHINE           = "overo"
> * DISTRO            = "angstrom"
> * DISTRO_VERSION    = "2010.7-test-20110219"
> * TARGET_FPU        = "hard"
> *
> * Notes:
> * - To have effect, gcc-cross has to be rebuild (changing all gcc packed
> *   was not an option)
> * - This patch does not affect libtool-2.4 distos
> * - The story is found at
> *   http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-February/030115.html
>
> Signed-off-by: Andreas Mueller<schnitzeltony@gmx.de>
Acked-by: Eric Bénard <eric@eukrea.com>


