Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 7566A60657
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 21:46:17 +0000 (UTC)
Received: (qmail 23069 invoked by uid 1003); 26 Oct 2015 21:46:18 -0000
Received: from unknown (HELO ?10.16.32.95?)
	(philip@opensdr.com@207.114.172.147)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	26 Oct 2015 21:46:18 -0000
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Philip Balister <philip@balister.org>
Message-ID: <562E9F28.3070508@balister.org>
Date: Mon, 26 Oct 2015 14:46:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
Subject: Updates to mesa and llvm
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
X-List-Received-Date: Mon, 26 Oct 2015 21:46:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Recently I need to get the llvmpipe driver running with mesa. I ended up
adding a llvm-3.7 recipe and updating mesa to 10.6.8. Not sure if going
to 11.x.y also works.

I'd like to upstream these since they configuration actually worked and
performance was much better. I recall some discussion lately about this
process and wanted to make sure I didn't break anything :)

I'll send on the llvm 3.7 stuff this week, since it should work in
parallel with the older recipe. I do need to move the license file
checksum into the version specific piece.

The timing on the mesa update is trickier since we are trying to
stabilize the oe-core release.

Comments? Will adding another llvm recipe cause trouble for other packages?

Philip

