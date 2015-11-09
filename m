Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 298D565CBF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 21:23:00 +0000 (UTC)
Received: from [192.168.178.101] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id E64F32A070
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 22:22:59 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <56410EB4.3010002@pseudoterminal.org>
Date: Mon, 9 Nov 2015 22:23:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: [meta-qt5] Why is GLib disabled?
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
X-List-Received-Date: Mon, 09 Nov 2015 21:23:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

in most Qt5 builds, I have seen GLib support enabled. But in meta-qt5, 
the corresponding packageconfig is disabled by default. Is there a 
reason for this?
It does cause problems when interfacing with libraries that make use of 
the GLib mainloop (for example, GStreamer).

