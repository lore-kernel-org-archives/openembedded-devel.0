Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 92A626BA73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:11:42 +0000 (UTC)
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id DAB7329C75
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 09:11:40 +0200 (CEST)
Message-ID: <521C514F.1000405@pseudoterminal.org>
Date: Tue, 27 Aug 2013 09:12:15 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: How can I make recipes conditionally enabled?
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
X-List-Received-Date: Tue, 27 Aug 2013 07:11:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have a question about a problem I've had several times in the past:

if I write a layer, and add .bbappends, then the layers with the 
corresponding .bb files become hard dependencies.
But lets say I want to write a BSP layer, and I add some machine 
specific Qt5 patches. Now everybody who wants to use
my layer must also include meta-qt5, even when they don't really want to 
use Qt5 anywhere. This is made even worse
if I have a dependency on meta-oe, which itself brings in a lot of 
modifications.

In short, I'd like to be able to make .bbappends and .bb files dependend 
on whether or not a layer is available. The hard
dependency is fine if it concerns things that are essential in my layer. 
But if its about optional things, it shouldn't cause
a build failure.

Thoughts?

