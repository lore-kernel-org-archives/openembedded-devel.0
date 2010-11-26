Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1PLxsH-0006px-Ji
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 13:58:02 +0100
Received: (qmail 7941 invoked by uid 0); 26 Nov 2010 12:56:45 -0000
Received: from 193.8.40.126 by www050.gmx.net with HTTP;
	Fri, 26 Nov 2010 13:56:44 +0100 (CET)
Date: Fri, 26 Nov 2010 13:56:44 +0100
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20101126125644.136270@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX18FC0dY22AFS3LZ7DnR87z7UI2wzDXIgyot4CcOY4
	93E03iVDsb+OECwtQySb0bh4zvthl301NWyg== 
X-GMX-UID: vZzJZBKSLi50ApBhjWtpDTJrZml1ZJgW
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: for doing screenshots from the command line - use scrot
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
X-List-Received-Date: Fri, 26 Nov 2010 12:58:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Marcin Juszkiewicz wrote:
> Can you compare it with fbgrab? Less deps and same work done.

fbgrab has a file size of 35k on my x86 system. scrot has 64k.
(this would favor fbgrab.)

fbgrab depends on libs png12 & a few standard libs.
(this would favor fbgrab.)

fbgrab uses the framebuffer devices. scrot uses X11.
(this results in fbgrab getting some boot time fb ascii console contents
on my x86 box whilst scrot really captures the scree X11 manages.
this means fbgrab is a pretty local thing that wont work by principle
when your X11 is based upon a driver that does NOT utilize fb buffers.
this would favour scrot in terms of flexibility and compatibility.)

fbgrab allwos width/height specification. scrot allows window specific capture (using the mouse) and has an option for taking window borders - since its X11 aware.
(this would favor scrot in terms of flexibility.)

fbgrab works on a single framebuffer. scrot is multi head aware and can even join the grabbed images to a whole desktop image - since its X11 aware.
(this would favor scrot in terms of flexibility.)

fbgrab is very limited in bit depth. scrot man pages does not talk about any bit depth limitations.
(this would favor scrot in terms of flexibility.)

fbgrab supports PNG. scrot supports PNG.
(on par.)

fbgrab seems to have a fixed image quality. scrot takes a quality argument.
(this would favor scrot in terms of flexibility.)

fbgrab needs an external utility for time stamping. scrot has it built in.
(time precision should be more accurate for scrot.
scripted execution time is somehwat lower with scrot.
this would favor scrot.)

fbgrab allows reading in sort of unformatted files. scrot allows imrpoved scripting using special wildcards and can pass these to a second application, e.g. a file system based hirarchical storage.
(this would favor scrot in terms of flexibility.)

fgrab stores the data as it is. scrot has a built in thumb nail option.
(this would favor scrot in terms of flexibility.)


my personal rationale why scrot is a good option to offer:

- the built in time stamping is very handy.
- the usage of X11 infrastructure makes it a different in functionality and thus working
-- in cases where X11 is not based upon fbdev
-- and for cases with alternate bit depths.
 (you probably want screenshots to work, not to be urged to first "fix" an incompletly implemented utility.)
- the compression ratio is flexible.
- there are low-effort paths for file processing and storage automation.


side note:
if its only about freezing fbdev contents for e.g. inspection with a hexadezimal view, then sometimes a simple "cat /dev/fb0 >freezed.raw" will do the job. clipping and compressing the result using a few stand alone applications might be a post processing path.
-- 
GMX DSL Doppel-Flat ab 19,99 &euro;/mtl.! Jetzt auch mit 
gratis Notebook-Flat! http://portal.gmx.net/de/go/dsl


