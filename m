Return-Path: <fw@javox-solutions.com>
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de
	[80.67.31.99])
	by mail.openembedded.org (Postfix) with ESMTP id 17C8877D4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 08:00:06 +0000 (UTC)
Received: from [87.78.181.177] (helo=[192.168.178.95])
	by smtprelay05.ispgateway.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES128-SHA:128) (Exim 4.84)
	(envelope-from <fw@javox-solutions.com>)
	id 1cwOoR-00045p-CU; Fri, 07 Apr 2017 10:00:07 +0200
To: Martin Jansa <martin.jansa@gmail.com>
References: <1491488169-27594-1-git-send-email-fw@javox-solutions.com>
	<CA+chaQed7K6WGiJurV+UeW4mFBLznixmdoz=LNrzJoiVwxqOPw@mail.gmail.com>
From: Florian Wickert <fw@javox-solutions.com>
Message-ID: <eb432284-2dff-cc51-ceab-ff29cc0b88cd@javox-solutions.com>
Date: Fri, 7 Apr 2017 09:58:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQed7K6WGiJurV+UeW4mFBLznixmdoz=LNrzJoiVwxqOPw@mail.gmail.com>
X-Df-Sender: ZndAamF2b3gtc29sdXRpb25zLmNvbQ==
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] jack: allow empty jack package to satisfy jack-dev dependency
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
X-List-Received-Date: Fri, 07 Apr 2017 08:00:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

You are right, empty packages are not a good solution. I made a new 
patch and fixed the dependency instead.


On 04/06/2017 06:12 PM, Martin Jansa wrote:
> NAK, no more useless empty packages, see ML it's discussed every few 
> weeks.
>
> On Thu, Apr 6, 2017 at 4:16 PM, Florian Wickert 
> <fw@javox-solutions.com <mailto:fw@javox-solutions.com>> wrote:
>
>     jack-dev depends on jack, which does not exist before this patch.
>     The empty package satisfies this dependency.
>
>     Signed-off-by: Florian Wickert <fw@javox-solutions.com
>     <mailto:fw@javox-solutions.com>>
>     ---
>      meta-oe/recipes-multimedia/jack/jack_git.bb <http://jack_git.bb>
>     | 2 ++
>      1 file changed, 2 insertions(+)
>
>     diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb
>     <http://jack_git.bb> b/meta-oe/recipes-multimedia/jack/jack_git.bb
>     <http://jack_git.bb>
>     index be5f7bb..61064f4 100644
>     --- a/meta-oe/recipes-multimedia/jack/jack_git.bb <http://jack_git.bb>
>     +++ b/meta-oe/recipes-multimedia/jack/jack_git.bb <http://jack_git.bb>
>     @@ -32,6 +32,8 @@ PACKAGECONFIG[opus] = "--opus=yes,--opus=no,libopus"
>      # portaudio is for windows builds only
>      EXTRA_OECONF = "--portaudio=no"
>
>     +ALLOW_EMPTY_${PN} = "1"
>     +
>      PACKAGES =+ "libjack jack-server jack-utils"
>
>      FILES_libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
>     --
>     2.1.4
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


