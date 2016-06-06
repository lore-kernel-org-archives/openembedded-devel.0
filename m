Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 545 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 Jun 2016 15:36:19 UTC
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 4D65F7705C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jun 2016 15:36:18 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id u56FRDIl001021
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jun 2016 17:27:13 +0200
Received: from [139.16.79.161] (MD1FZU9C.ww002.siemens.net [139.16.79.161])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u56FRDIY013298
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jun 2016 17:27:13 +0200
To: openembedded-devel@lists.openembedded.org
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <57559651.3050805@siemens.com>
Date: Mon, 6 Jun 2016 17:27:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
Subject: [meta-qt5] backport 2 commits to krogoth
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
X-List-Received-Date: Mon, 06 Jun 2016 15:36:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello

I would like to request a backport of the following two fixes to the krogoth branch of meta-qt5

https://github.com/meta-qt5/meta-qt5/commit/0717c65abc24d67887c93b773129156f714d033b
https://github.com/meta-qt5/meta-qt5/commit/05103827d50ec218954dee3866ec40bee9ec59af

These two issues prevent us from building any CMake enabled projects with an optional dependency to Qt5.
Event recipes in meta-openembedded need some hack to work around this issue: https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb#L12

Since master is already on 5.7 it would help to have these fixes in krogoth where 5.6 is the default.

Regards
Pascal

