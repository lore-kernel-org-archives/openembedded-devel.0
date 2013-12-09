Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id C99FE6DEF4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2013 21:12:07 +0000 (UTC)
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 0BDEC213BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2013 22:12:06 +0100 (CET)
Message-ID: <52A63287.6060100@pseudoterminal.org>
Date: Mon, 09 Dec 2013 22:13:43 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Compiler flags in machine features for specific GCC versions
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
X-List-Received-Date: Mon, 09 Dec 2013 21:12:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello, I have Marvell PJ4 based platform which didn't get extra GCC 
support until GCC 4.8. It added "marvellpj4" as an arch.
However, if for some reason GCC 4.7 is used, and --march=marvellpj4 is 
used, then building will fail.

Is there a way to add a --march=marvellpj4 flag to TUNE_CCARGS if and 
only if GCC >= 4.8 is used for cross compiling?

cheers

