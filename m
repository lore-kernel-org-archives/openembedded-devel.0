Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E73C17680A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 18:31:19 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 78B125C01B4;
	Thu, 28 Apr 2016 20:29:31 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 28 Apr 2016 11:27:48 -0700
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f652e665e55a2c4b8c28b37918fb4bfb@agner.ch>
References: <1458862016-19466-1-git-send-email-stefan@agner.ch>
	<20160325103723.GB2555@jama>
	<f652e665e55a2c4b8c28b37918fb4bfb@agner.ch>
Message-ID: <29fc282dcd1db1832d1e5ef9da5e67f4@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1461868171; bh=t1WyR81PiLVyafRpOqcKx+OEe7DdU6/gTBu9XH/eZrs=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=dLqWh3Zed0iXpkzm+x5gRjZToRJQoEp+3tEXFqGd1SKeQ1t4JVApXy87Dcz5DqtM6KtV7nirFf7AmK+pZH5v+UUje+so+BJolPyCrcInC3s6J4gwzSgx9VqzRy/qDq25YDK67VQTr9F7o28bSCUXwthEbedCp7IDdDPFaIIoS3Y=
Cc: marcel@ziswiler.com, Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-multimedia][jethro][PATCH] gstreamer: fix argument parsing when using Bison 3
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
X-List-Received-Date: Thu, 28 Apr 2016 18:31:22 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2016-03-25 11:16, Stefan Agner wrote:
> On 2016-03-25 03:37, Martin Jansa wrote:
>> On Thu, Mar 24, 2016 at 04:26:56PM -0700, Stefan Agner wrote:
>>> From: Stefan Agner <stefan.agner@toradex.com>
>>>
>>> Remove the argument fix patch and add a patch which fixes the
>>> grammer.y Bison input file. YYLEX_PARAM seems to be no longer
>>> supported and has been replaced with %parse-param which has
>>> been introduced already in 2003.
>>>
>>> This fixes a segmentation fault when launching gst-launch-0.10.
>>
>> Is this needed in master branch as well?
> 
> Yes.
> 
>> All changes for released branch should go to master first.
>>
> 
> Sorry, should have added [master] to the subject.


This has made it to the master branch in between but has (not yet?) been
applied to jethro. Any chance to get it into jethro too?

http://git.openembedded.org/meta-openembedded/commit/?id=6132a35f8cf3906acef4ba54b7d8819a82e05be0

--
Stefan

> 
>>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>>> ---
>>> This is the stack trace of the segmentation fault:
>>> (gdb) bt
>>> #0  priv_gst_parse_yylex (yylval_param=yylval_param@entry=0xbe8a4224, yyscanner=0xc8) at lex.priv_gst_parse_yy.c:1153
>>> #1  0x4022d712 in priv_gst_parse_yyparse (scanner=<optimized out>, graph=graph@entry=0xbe8a47ec) at grammar.tab.c:1821
>>> #2  0x4022f18c in priv_gst_parse_launch (
>>>     str=0x94f28 "filesrc location=/home/root_2p_key60_q90_aac128_44.mp4 ! qtdemuxemux demux.video_00 ! nv_omx_h264dec ! nv_gl_eglimagesink demux.audio_00 ! nv_omx_aacdec ! alsasink device=hw:0,0 ",
>>>     error=error@entry=0xbe8a4910, ctx=ctx@entry=0x0, flags=flags@entry=GST_PARSE_FLAG_NONE) at /usr/src/debug/gstreamer/0.10.36-r2/gstreamer-0.10.36/gst/parse/grammar.y:927
>>> #3  0x402277b8 in gst_parse_launch_full (
>>>     pipeline_description=0x94f28 "filesrc location=/home/root_2p_key60_q90_aac128_44.mp4 ! qtdemuxemux demux.video_00 ! nv_omx_h264dec ! nv_gl_eglimagesink demux.audio_00 ! nv_omx_aacdec ! alsasink device=hw:0,0 ", context=context@entry=0x0, flags=flags@entry=GST_PARSE_FLAG_NONE, error=error@entry=0xbe8a4910) at /usr/src/debug/gstreamer/0.10.36-r2/gstreamer-0.10.36/gst/gstparse.c:336
>>> #4  0x40227968 in gst_parse_launchv_full (argv=argv@entry=0x7ad50, context=context@entry=0x0, flags=flags@entry=GST_PARSE_FLAG_NONE, error=error@entry=0xbe8a4910)
>>>     at /usr/src/debug/gstreamer/0.10.36-r2/gstreamer-0.10.36/gst/gstparse.c:272
>>> #5  0x402279f2 in gst_parse_launchv (argv=argv@entry=0x7ad50, error=error@entry=0xbe8a4910) at /usr/src/debug/gstreamer/0.10.36-r2/gstreamer-0.10.36/gst/gstparse.c:224
>>> #6  0x0000a6d8 in main (argc=16, argv=0xbe8a4ca4) at /usr/src/debug/gstreamer/0.10.36-r2/gstreamer-0.10.36/tools/gst-launch.c:1031
>>>
>>>  ...01-parse-make-grammar.y-work-with-Bison-3.patch | 35 ++++++++++++++++++++++
>>>  ...mer-change-priv_gst_parse_yylex-arguments.patch | 33 --------------------
>>>  .../gstreamer-0.10/gstreamer_0.10.36.bb            |  2 +-
>>>  3 files changed, 36 insertions(+), 34 deletions(-)
>>>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
>>>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
>>>
>>> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
>>> new file mode 100644
>>> index 0000000..dc2d606
>>> --- /dev/null
>>> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
>>> @@ -0,0 +1,35 @@
>>> +From 60516f4798894f958fc53b470e1283318d0f8706 Mon Sep 17 00:00:00 2001
>>> +From: Kerrick Staley <kerrick@kerrickstaley.com>
>>> +Date: Tue, 20 Aug 2013 23:59:29 -0700
>>> +Subject: [PATCH 1/2] parse: make grammar.y work with Bison 3
>>> +
>>> +YYLEX_PARAM is no longer supported in Bison 3.
>>> +
>>> +https://bugzilla.gnome.org/show_bug.cgi?id=706462
>>> +---
>>> + gst/parse/grammar.y | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/gst/parse/grammar.y b/gst/parse/grammar.y
>>> +index 24fc87b..7f9dd16 100644
>>> +--- a/gst/parse/grammar.y
>>> ++++ b/gst/parse/grammar.y
>>> +@@ -26,7 +26,6 @@
>>> +  */
>>> +
>>> + #define YYERROR_VERBOSE 1
>>> +-#define YYLEX_PARAM scanner
>>> +
>>> + #define YYENABLE_NLS 0
>>> +
>>> +@@ -648,6 +647,7 @@ static int yyerror (void *scanner, graph_t *graph, const char *s);
>>> + %right '.'
>>> + %left '!' '='
>>> +
>>> ++%lex-param { void *scanner }
>>> + %parse-param { void *scanner }
>>> + %parse-param { graph_t *graph }
>>> + %pure-parser
>>> +--
>>> +2.7.2
>>> +
>>> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
>>> deleted file mode 100644
>>> index bf93cb2..0000000
>>> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
>>> +++ /dev/null
>>> @@ -1,33 +0,0 @@
>>> -gstreamer: change priv_gst_parse_yylex arguments
>>> -
>>> -Change priv_gst_parse_yylex to fit new bison version, else we will
>>> -get following error:
>>> -
>>> -| grammar.tab.c: In function 'priv_gst_parse_yyparse':
>>> -| grammar.tab.c:67:25: error: too few arguments to function 'priv_gst_parse_yylex'
>>> -|  #define yylex           priv_gst_parse_yylex
>>> -|                          ^
>>> -
>>> -Upstream-Status: Pending
>>> -
>>> -Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>>> ----
>>> - gst/parse/grammar.y | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/gst/parse/grammar.y b/gst/parse/grammar.y
>>> -index 24fc87b..24fe906 100644
>>> ---- a/gst/parse/grammar.y
>>> -+++ b/gst/parse/grammar.y
>>> -@@ -36,7 +36,7 @@
>>> -
>>> - typedef void* yyscan_t;
>>> -
>>> --int priv_gst_parse_yylex (void * yylval_param , yyscan_t yyscanner);
>>> -+int priv_gst_parse_yylex (yyscan_t yyscanner);
>>> - int priv_gst_parse_yylex_init (yyscan_t scanner);
>>> - int priv_gst_parse_yylex_destroy (yyscan_t scanner);
>>> - struct yy_buffer_state * priv_gst_parse_yy_scan_string (char* , yyscan_t);
>>> ---
>>> -1.9.1
>>> -
>>> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
>>> index 5b30603..ad7cf99 100644
>>> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
>>> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
>>> @@ -15,7 +15,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz
>>>             file://check_fix.patch \
>>>             file://gst-inspect-check-error.patch \
>>>             file://0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch \
>>> -           file://gstreamer-change-priv_gst_parse_yylex-arguments.patch \
>>> +           file://0001-parse-make-grammar.y-work-with-Bison-3.patch \
>>>  "
>>>
>>>  SRC_URI[md5sum] = "a0cf7d6877f694a1a2ad2b4d1ecb890b"
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

