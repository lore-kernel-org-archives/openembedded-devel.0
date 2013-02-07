Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3YuC-0006sd-K4 for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2013 22:21:42 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3YBW-0004PV-2g for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2013 21:35:06 +0100
Received: from tfitzsim-lnx.cisco.com ([161.44.225.6])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2013 21:35:06 +0100
Received: from fitzsim by tfitzsim-lnx.cisco.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2013 21:35:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Thomas Fitzsimmons <fitzsim@cisco.com>
Date: Thu, 07 Feb 2013 15:29:03 -0500
Message-ID: <cover.1360262057.git.fitzsim@cisco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: tfitzsim-lnx.cisco.com
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1.50 (gnu/linux)
Cancel-Lock: sha1:T+kWnSTPTh+bYY7hyNu2z2xfbN8=
Subject: [meta-oe][PATCH 0/2] Refactor lmsensors to allow machine-specific configuration
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
X-List-Received-Date: Thu, 07 Feb 2013 21:24:42 -0000
Content-Type: text/plain

Hi,

This patchset splits lmsensors configuration files into a separate
machine-specific "lmsensors-config" recipe.  The main lmsensors recipe
can remain machine-agnostic while sensor configuration files can be
customized on a per-machine basis by extending the lmsensors-config
recipe.

This is useful when targetting multiple machines that share the same CPU
architecture but differ in the number or type of sensors available on
each.  The lmsensors packages can be shared among all the machines, and
configuration packages made available on a per-machine basis.

Thomas

Thomas Fitzsimmons (2):
  lmsensors-config: Initial commit
  lmsensors: Add lmsensors-config RRECOMMENDS

 .../recipes-support/lm_sensors/files/fancontrol    |    2 -
 .../recipes-support/lm_sensors/files/fancontrol.sh |   48 -----------------
 .../recipes-support/lm_sensors/files/sensord.cgi   |   10 ----
 .../recipes-support/lm_sensors/files/sensord.conf  |   16 ------
 .../recipes-support/lm_sensors/files/sensord.sh    |   49 -----------------
 .../recipes-support/lm_sensors/files/sensors.conf  |    2 -
 .../lm_sensors/lmsensors-config/fancontrol         |    2 +
 .../lm_sensors/lmsensors-config/sensord.cgi        |   10 ++++
 .../lm_sensors/lmsensors-config/sensord.conf       |   16 ++++++
 .../lm_sensors/lmsensors-config/sensors.conf       |    2 +
 .../lm_sensors/lmsensors-config_1.0.bb             |   50 +++++++++++++++++
 .../lm_sensors/lmsensors/fancontrol.init           |   48 +++++++++++++++++
 .../lm_sensors/lmsensors/sensord.init              |   49 +++++++++++++++++
 .../recipes-support/lm_sensors/lmsensors_3.3.2.bb  |   56 +++++++-------------
 14 files changed, 196 insertions(+), 164 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.cgi
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.conf
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.sh
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/sensors.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config/fancontrol
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.cgi
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config/sensors.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors/sensord.init




