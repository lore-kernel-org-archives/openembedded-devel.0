Received: from [66.249.82.224] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HOy75-000469-FP
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Mar 2007 16:31:35 +0100
Received: by wx-out-0506.google.com with SMTP id t14so197001wxc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2007 07:31:34 -0800 (PST)
Received: by 10.90.68.15 with SMTP id q15mr7151106aga.1173281494722;
	Wed, 07 Mar 2007 07:31:34 -0800 (PST)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id j7sm969321nzd.2007.03.07.07.31.33;
	Wed, 07 Mar 2007 07:31:34 -0800 (PST)
Date: Wed, 7 Mar 2007 17:31:36 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <151838550.20070307173136@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Handling machines of the same architecture by different screen resolutions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2007 15:31:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  Continuing discussion of how to handle such important machine
property like screen size/resolution, here's the issue: there're
cases, when same "machine" in OE terms actually has submodels which
differ in screen resolution. One example is recently added aximx50
machine. That machine covers Axim X50, Axim X50V, Axim X51, Axim X51V
PDA models. "V" models have VGA screen, others - QVGA. They are served
by the same kernel port, though defconfigs for "V" models differ, as
there's no runtime detection.

  And, again, screen sizes differ, so "V" machines should be
bigscreen, while "V-less" - smallscreen. Does this warrant adding
another machine to OE to cover "V" models? (It would be obviously
done via refactoring common parts to machine/include/ ).

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



