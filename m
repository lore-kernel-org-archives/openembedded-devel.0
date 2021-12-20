Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4904AC4332F
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:02:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.6246.1640012545705985280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i0IUNLDp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012543; i=@fujitsu.com;
	bh=/v/p6zsRRpnE7p1ZnqEns+awvRhxIGJS7WzuUwyCHJ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=i0IUNLDpExkyo6qzsAqJour2B2jkVUH07yPbvUdwEsYlJQ2Wg8qEr7CjiRu5Hi1QJ
	 9pRMW8OPRAMPgeiwve445RLnbe3kjvUNhWPrYjvrAn49JIjEX2LbBjSjD3u6ULl48F
	 5uXo+sVGHQCRT+v2G9dgygo1n8AWdROxjnLUNVR+y64AzQyjTXnLIyb40XAYCw4nc0
	 ti37b9hGNOjIN8clu62WA0+SxBEEbiUV+JPdHPlNY7lejnlcyKSeyZJmcQ/K5DR868
	 dylwsrmcq/UQdzm5z0jCzW9L4gsRscqvvYSCiNqtmNfjH0ECc0oz+LY5BioBFjYPPT
	 vLTfXahBucRMA==
Received: from [100.115.6.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 4D/AE-14524-FFA90C16;
 Mon, 20 Dec 2021 15:02:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqPt/1oF
  Eg3PLWCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxpvYsYCy7lVFz+8Zi9gbEhpouRi0NI4Amj
  xI71N1khnAtMEqf77zFBOCcYJfae/M/cxcjJwSagJjH91g1WEFtEQF9i6ew9YHFmARWJF7972
  EFsYQELif/nLrKB2CwCqhInbz1iArF5BRwletbdBLMlBBQkpjx8D9bLKeAksX7KLjBbCKhm28
  YTUPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsColZs9qgZqpJXD23iXkCo+AsJO2zkLQvYGR
  axWiZVJSZnlGSm5iZo2toYKBraGiqa6xrYaaXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYxCnFzGE7GP/0/tQ7xCjJwaQkysvveyBRiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvzxlAOcGi1PTUirTMHGBEwaQlOHiURHibQNK8xQWJucWZ6RCpU4y6HM2Tlm9nFmLJy89LlR
  LnjQPGp5AASFFGaR7cCFh0X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzJsOMoUnM68EbtM
  roCOYgI5QCt8PckRJIkJKqoFp+rPd7lMfv0id+GDS9/6vsVs+F65SNmbftOyO9BvO9apTUq6s
  es3Cnb37ZQTfomuHCzZKabd2Na/648Z7iO3I97ZH1pN7uaYGy1jfPXFB+ZFJ31t5SQsW9122x
  WyrbxnPP/9lzb2ED6fS0qPnrb4f4ca7rL36O6PaE+V8Zu6uRSK1ZsfusXtMlXk8/0/XWkmV5F
  jrj64bNe9cUvSUqf/+dePTf/OPhpe58q4p7NdoTw66NHH6tWvXGI6cFjqYGOrolW504ahV+A7
  FGdMctJ0/H23Ky+V7tqK7XCXS90cs9xP1hyoBS38pH1ZavepiesheJfkcLk6zpeGiPnu+vfB+
  oXQn5GHSCSGeh35HbjZoKLEUZyQaajEXFScCAJ3EvkJpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1640012542!12971!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4124 invoked from network); 20 Dec 2021 15:02:23 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:02:23 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 97CC21009F5
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:02:22 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8B3F710023B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:02:22 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:02:05 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 5.9 -> 6.0
Date: Mon, 20 Dec 2021 23:01:49 +0800
Message-ID: <1640012509-3594-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640012509-3594-1-git-send-email-wangmy@fujitsu.com>
References: <1640012509-3594-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:02:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94447

Changes between v5.9 and v6.0:
------------------------------

bindings: allow rebinding ^Z also on a Linux console (a VT)
bindings: allow toggling line numbers (when enabled) also in tiny version
bindings: let ^T in the tiny version invoke spell checker (when included)
browser: with --zero, do not use the bottom row for displaying filenames
build: fix compilation when configured with --disable-color
build: fix compilation when configured with --disable-nanorc
build: fix compilation when configured with --enable-tiny
build: fix compilation with --enable-tiny --enable-nanorc
build: fix compilation with --enable-tiny --enable-wrapping
build: include the YAML syntax file among the distributed files
bump version numbers and add a news item for the 6.0 release
display: clear the status bar early enough, so that --zero can show text
display: do not wipe the status bar when --zero or --minibar is active
display: ensure feedback will be cleared also on a one-row terminal
display: make sure there are at least as many text lines as help lines
display: move some code for overwriting verbatim feedback with --zero
display: redraw the screen in tiny version upon resuming from suspension
display: with --zero, redraw the bottom row instead of wiping a message
docs: add a hint about making ^L do just 'refresh' to the sample nanorc
docs: add a meta description for the HTML rendering of the manual
docs: add a suggested rebind and three suggested unbinds to the sample rc
docs: avoid large Table of Contents at top of HTML version of manual
docs: clarify that --enable options do not fully counteract --enable-tiny
docs: correct the description of the layout -- four areas, not five
docs: document the effect of --quickblank together with --zero/--minibar
docs: explain the effect of --zero / -0 / 'set zero'
docs: explain what it means when --rawsequences is needed
docs: give more examples of things that --enable-tiny excludes
docs: improve the title of the manual, away from the bare "nano"
docs: list the new color names, from 'rosy' to 'crimson'
docs: mark options -z, --suspendable, and 'set suspendable' as obsolete
docs: mention "grey" also at the other place where color names are listed
docs: mention M-Z (for toggling the interface) among the Feature Toggles
docs: mention that --zero and 'set zero' hide also the help lines
docs: move the chapter about editor basics into third position
docs: prevent a black square in the PDF after the long synopsis line
docs: reshuffle a GNU marker, to make the title clearer in search engines
docs: reword several of the descriptions in the chapter on building nano
docs: reword the beginning of the chapter on nanorc files
docs: say thanks to the Indonesian translator
feedback: give a more accurate message when the help lines won't appear
feedback: refuse the --constantshow toggle (M-C) on a one-row terminal
feedback: report an unbindable function key as an "Unknown sequence"
feedback: report the number of inserted lines also with --zero or --mini
feedback: show a relevant message for M-O when the syntax has 'tabgives'
feedback: suppress chatty messages when --zero is active
feedback: to have a status bar, suppress --zero while in the help viewer
feedback: when reporting an unbound function key, mention its number
feedback: when the user types ^Z, say they can suspend nano with ^T^Z
feedback: with --mini or --zero, suppress number of lines for new buffer
feedback: with --mini/--zero, suppress message when toggling whitespace
feedback: with --zero, drop a message in a short while, as with --minibar
files: allow inserting also when started with the --noread option
files: clear original filename when the user toggles Append or Prepend
gnulib: update to its current upstream state
help: do not show ^S when --preserve is in effect
help: ensure there is a blank line between title bar and start of text
help: group the now lone mouse toggle with the "behavioral" ones
help: remove an unneeded restriction for small terminals
help: skip the leading blank line when the terminal is very flat
help: when done, always redraw the "bottom bars", also with --zero
history: process file faster by not filtering out hypothetical duplicates
input: ensure that no more bytes are consumed than are available
justify: correctly determine whether top-of-buffer has been reached
memory: avoid a tiny leak when an option with an argument is given twice
memory: avoid leaking the filename when dottifying it on the minibar
new feature: option --zero for an interface without bars
options: make --zero imply --nohelp, and 'set zero' imply 'set nohelp'
pasting: when less than a line is pasted, allow automatic hard-wrapping
prompt: avoid resetting the history pointer when the search is cancelled
prompt: begin at bottom of history list when at secondary prompt
prompt: keep a clear answer clear also after an excursion into history
rcfile: recognize fourteen new color names, mostly for subdued shades
rcfile: remove the deprecated 'cutwordleft' and 'cutwordright' keywords
replacing: keep centering the occurrence, also after toggling help lines
replacing: keep the spotlighted occurrence in view, also with --zero
replacing: keep the spotlighting, also after toggling the help lines
search: with --zero, do not obscure an occurrence on the bottom row
search: with --zero, drop a message at the same time as the spotlight
statusbar: count words in the way that matches how Ctrl+Right moves
statusbar: overwrite a message also when using --constant with --zero
suspension: enable ^Z by default -- ignore -z option and drop M-Z toggle
suspension: leave ^Z unbound by default -- just ^T^Z will suspend nano
syntax: debian: remove file -- Debian itself will have to handle it
syntax: default: colorize comments as one of the last things
syntax: default: colorize dates, URLs, and nano's release motto
syntax: email: use a character class, as \s does not work inside brackets
syntax: gentoo: remove file -- Gentoo itself will have to handle it
syntax: nanorc: add 'execute' menu for unbind, and drop a bad constraint
syntax: nanorc: avoid colorizing #rgb codes as if they were comments
syntax: nanorc: colorize a trailing comment when it begins with non-hex
syntax: nanorc: colorize each of the fourteen new color names as valid
syntax: nanorc: improve the file-matching regex
syntax: nanorc: paint arguments of 'include' and 'extendsyntax' specially
syntax: nanorc: require whitespace before the start= and end= keywords
syntax: python: colorize backslash escapes, such as \n and \xef
syntax: ruby: colorize embedded documentation as a comment
syntax: rust: do not colorize as string the text between two strings
syntax: sql: add a few more missing keywords, like TRUE and FALSE
syntax: sql: add more missing keywords, like INNER and OUTER JOIN
syntax: sql: add some missing keywords, like ALL and ANY and OR
syntax: sql: add two missing data types -- xml and tsquery
syntax: sql: colorize as flow control only keywords that clearly are such
syntax: sql: colorize keywords regardless of case, and tweak the colors
syntax: sql: colorize only single-quoted things as strings
syntax: sql: colorize strings differently than types
syntax: sql: remove alien stuff -- it was copied mostly from ruby syntax
syntax: texinfo: be more precise in colorizing @commands
syntax: texinfo: colorize the special @-plus-punctuation commands too
syntaxes: avoid coloring "this\" as if it were a valid string
syntaxes: colorize hex more strictly by using character class [:xdigit:]
syntaxes: drop three redundant end-of-line anchors
syntaxes: undouble the backslash within bracket expressions
syntaxes: use one regex for coloring quoted strings, to avoid overlap
tabbing: also with --zero, stay one row away from the prompt bar
tweaks: add an auxiliary variable, to prepare for handling --zero
tweaks: add two spaces and two comments, and drop an internal check
tweaks: adjust two values -- help lines need at least 6 rows to be shown
tweaks: avoid a compiler warning with --enable-tiny --enable-linenumbers
tweaks: avoid redrawing the entire window when just a 'touch' will do
tweaks: condense the definitions of all the empty functions
tweaks: condense the regexes for Types in the SQL syntax
tweaks: don't redraw the help lines (if present), and normalize a brace
tweaks: drop a fragment of code that became functionless
tweaks: elevate two messages, so they get shown with --mini or --zero
tweaks: elide a variable that is confusing and has just one use case
tweaks: elide two functions that each were called just once
tweaks: elide two parameters, as they are now always the same
tweaks: exclude some hidden-interface code from the tiny version
tweaks: exclude some suspension code from the tiny version
tweaks: fix a parentheses mistake -- found by a warning from Clang
tweaks: fix a somewhat humorous typo
tweaks: fix typo, and improve description of 'set zero' in sample nanorc
tweaks: fold a special case into the general one
tweaks: fold some regexes together, and trim or improve some comments
tweaks: frob a couple of comments, and drop two, for conciseness
tweaks: improve a comment, and drop two cluttering compile conditions
tweaks: invert a condition, to get an early return instead of indentation
tweaks: just let do_wrap() set 'refresh_needed' instead of returning TRUE
tweaks: mark keystrokes consistently with @kbd in the manual
tweaks: move a translator hint to where xgettext will see it
tweaks: normalize whitespace, drop unneeded prototype, condense comment
tweaks: on one-row terminals, suppress the message for two toggles
tweaks: place the unsetting of a flag better, and rename a variable
tweaks: put three email addresses between the customary angled brackets
tweaks: reassign a copy of a string to a variable more economically
tweaks: reduce redundancy (--enable-color implies --enable-nanorc)
tweaks: remove redundant pair of parentheses, and swap two alternatives
tweaks: remove redundant parentheses, trim comments, fold some regexes
tweaks: remove two unneeded unsettings
tweaks: rename a function and its parameter, to be clearer
tweaks: rename a function, away from using an abbreviation
tweaks: rename a function, for some contrast and to get rid of a suffix
tweaks: rename a function, to describe better what it does nowadays
tweaks: rename a function, to make it make sense
tweaks: rename a variable, to be distinctive and less confusing
tweaks: rename a variable, to be easier to read and to make more sense
tweaks: rename five empty functions, to get rid of a meaningless suffix
tweaks: rename three functions, to better fit the general scheme
tweaks: rename three parameters, away from single letters
tweaks: rename two empty functions, to be more to the point
tweaks: rename two functions, to get rid of another senseless suffix
tweaks: rename two functions, to get rid of one more senseless suffix
tweaks: rename two functions, to get rid of the senseless suffix of one
tweaks: rename two more functions, to lose a senseless suffix
tweaks: rename two parameters and one variable, away from single letters
tweaks: rename two variables, away from abbreviations
tweaks: rename two variables, to fit with the names of similar ones
tweaks: replace a verbose condition with a simpler early return
tweaks: replace the obscure @* with the slightly clearer @sp
tweaks: replace two direct refreshes with two scheduled ones
tweaks: reshuffle a coloring rule, to have related ones together
tweaks: reshuffle a few lines, and rename a variable
tweaks: reshuffle a few lines, for Christmas and to group things better
tweaks: reshuffle a fragment of code to a better place
tweaks: reshuffle a line and adjust indentation after previous change
tweaks: reshuffle a line into its proper order, and improve two comments
tweaks: reshuffle some conditions, so that the ifs have similar formats
tweaks: reshuffle some conditions, to have more balanced lines
tweaks: reshuffle some lines, one for clarity, others for conciseness
tweaks: reshuffle the flag conversion into their order in the help text
tweaks: reshuffle two conditions, re-indent, and rewrap a line
tweaks: reword a paragraph, and use usual M- to depict Meta keystrokes
tweaks: rewrap an old news item, for distraction
tweaks: rewrap three old NEWS items, for esthetics, and fix a date
tweaks: shorten a comment, and drop some conditionalizing
tweaks: shorten the description of --zero in the manuals a bit
tweaks: shorten two comments, and fold two statements together
tweaks: swap two parts of specific regexes, for consistency with others
tweaks: untangle two case items, and shorten a message
tweaks: use a color closer to the rest of the string, to reduce contrast
tweaks: use a few fewer capitals, and drop an unneeded synonym
docs: add a description of the hexadecimal #rgb color specification
rcfile: support #rgb format for specifying colors in 256-color terminals

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_5.9.bb => nano_6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.9.bb => nano_6.0.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_5.9.bb b/meta-oe/recipes-support/nano/nano_6.0.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_5.9.bb
rename to meta-oe/recipes-support/nano/nano_6.0.bb
index 85c81fb79..72558644f 100644
--- a/meta-oe/recipes-support/nano/nano_5.9.bb
+++ b/meta-oe/recipes-support/nano/nano_6.0.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "757db8cda4bb2873599e47783af463e3b547a627b0cabb30ea7bf71fb4c24937"
+SRC_URI[sha256sum] = "93ac8cb68b4ad10e0aaeb80a2dd15c5bb89eb665a4844f7ad01c67efcb169ea2"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1


