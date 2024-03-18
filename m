Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EB0C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 20:05:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.118])
 by mx.groups.io with SMTP id smtpd.web10.55331.1710792303917025167
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 13:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=O1AWm4/a;
 spf=pass (domain: navimatix.de, ip: 40.107.21.118, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BM2TsNOa67bcDDTmtttkLhjKXJZ1Mz90WcbStC5d5Zl0P+8D76aqH4hoZERa2B2NvicM/pPhpy2wV36D8NQPm1O4rNyJ/au3+m4ZidAal3wls46m33r8pguOsaQXjJss9L7jPs86PK+b/WYA59FumFzj6kAC+j1LV2O/yNCXkLbYMk5aYGDpOV5kGWSS60MLKgf1Zkk10R7JecldpPjFDKAU9LmxoMWlPFkA1vFQ4jayk4FGTJIw8Hg7afLIebtgXbuZrsFSgsR0ntsM6hoyupD5mMULPl7WYOcGCkUMjXTggDj+ur5625zaITm3H1y8Q5MyL+k+wHB2Dh2/1Y+NSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4LDNLUdtnpmS4aDrD2xoMgJlGbZNpFUWRD20EotgHo=;
 b=hcDRvg5/gpCt4LRjUE75/Y+fKsebxitizMbo8H1+/bvmeAgfxXZKVUg38rG6vbx41BHMADuz4BjH0Ztyum8RcOJqcpqwPpM5ddkI7rIeb3+UXaDvgOkbP7j8Z4TBPGtTLX/GxmY+lwEtpAIhRCWfSQk5nUECotVWFWR/SsCAvUn1jFn0T8XYcV/kqVihtjV1UY3BaZxA1BVPEnPZ+gLyjvbL0Lia6VWxaAVakY3YSErLcCRg8ryENvSC3VtAPng/201hnJGSWa4Kp0kgwxrAiBEW/WBbaBlA2E3NtIiX9p1/KOcur/Bx5EozdUMkXfWred8D6vFRAFnS64yLooOWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4LDNLUdtnpmS4aDrD2xoMgJlGbZNpFUWRD20EotgHo=;
 b=O1AWm4/aao307oY1oUXR4EVdnOlDx0vn6QSZ3ydISJpm58i8rr41kOVtO5rACcJS9BvyeGqf/bRk505FTdiBfI+/QYYwhzARISIT5e7aVeKONqYckUvxynj0lmBLv+phH017PurV8HuvUaXlwIfHJTPzkS2VbrLNZSHGV68VNGo=
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20) by AM0PR01MB6290.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:160::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 20:04:59 +0000
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5]) by
 DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5%6]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 20:04:59 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-networking][PATCH] bluez-tools: New recipe for bluez5 tools
Date: Mon, 18 Mar 2024 21:04:37 +0100
Message-ID: <61b132bb6fe3c5ae371b12c4a9f55b1d9a024031.1710792277.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::28) To DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0102MB3658:EE_|AM0PR01MB6290:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jo/E79oyNHcUILQ+na3KQoZwL6RiqbBKZr+rwOZdnKn8jW6KMiJMIZ1o4QUEqZs6XRR1/oFwGNvfqJb3GEjNipcJm1uTdNAPFWAshcPRbrfL77nv9e9fS59TJgL2LuzUnmFsVF34ryvkfirlpVG+E7shAvC28WZU60295PSgpL9z+GSlU5+fXvMVK7l3rBzlfWjPe3wjAAjGPE09IlmhdOehPxkF50uRDPTVCii03Ps+oN368XYMRKjzkPY0aCivGb+ggCgdzL3yaLimlJDhlt8cLrV6mcJfxN3daZH/eCthy3jAVmgWgFhfZicC3gxl5P9tjr1e03+CVXrjL89JWSn4hBnFbrAeRIR3Z8YEcm96TlRvGNUBpx9G+wiQ8xw/kiGgvGWSLkdgaDfntzyO0k9+TPnIwsGZZFh4Y5mvWHpKUwlOz0KmRs9qz+I5sfLeI8tMAGxn/zg8olQKGVZ3g8iUR+m2blZSyOaVcfrLXzN8Ch/jprpVCvzW56DCvi/+2sq0jp/Cyt4Hc478m7MqDLwZdRm+vCH5n0bBwTN1Pil+wxAmQquwFH/21I4Ip5qsMOh77F+gPneYznEijWR9qwhBU+DlH/MN+3mb8mFlf5wVSgMkhGpNGYVPscJEeWoUtpwAX/OARi/uxxcM7pBYuCAAx9Wjg0zP5okVDoEp2Dw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0102MB3658.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b7VJGoZFo2nvWohP6kqXofA0hhQK8kTRoU8ZgMNMrl1XtWcN3YlwAikLgsHw?=
 =?us-ascii?Q?kZ4CI/+mMagS0XIthIkZ710MVCrHFG1x3NbemYvvuM6KB6KFBodcl9yPRzG0?=
 =?us-ascii?Q?61Jbi9s8ldwDVFil4vl+fHa81kIl4B0o7ycnXRuBoiv6/lzi61vM9++il9he?=
 =?us-ascii?Q?4N1fJIoTccvfdaN5W58Ql9dlnzTa6013ROzT9J+Rj55kdGQdaBsIBlaOzLmI?=
 =?us-ascii?Q?Fg7sqaS5oiZ9C0WRH3zCNQbKWRqHdbMQkTEfk0tkpUQ/Dcjz+DSyDQsM5jc5?=
 =?us-ascii?Q?SJQfPayo0d6PB1NWncJZu9AL8UqUy+g0N7qdw3B1/8sBWHv7+GzxVAPyoF+3?=
 =?us-ascii?Q?lLG4KIhZ4WMpTq2QE+4elCg2w1WnhFXwvUQJ2Q27GgCHg1eghKQOQKZiQPNI?=
 =?us-ascii?Q?gxYJ7w+PsdZJlAF6lrLJxHRqjBg9pewXpt95aYKDp10yfBfFrY2j4LnesDo+?=
 =?us-ascii?Q?PlxcI9QThUwZ+YApcDEXROVyKF4jiejXYgQvRQxw52Fpvj9Orb7C7nqAhIJM?=
 =?us-ascii?Q?ooWRf1g8h2QnsGWHXpFWzZTP64K5oBNjBHEI0SsIhHh28wCUZ6Ba9eFQC3xK?=
 =?us-ascii?Q?QAXAEfAP3rmWQOgTiiT+PeYsK9wsn58iupLQaWW38OTAiDG47zaOADrrgPmz?=
 =?us-ascii?Q?ssI79X1iHi8Hl1prFuEdJ1TxTk8MzYgyGYtS+dldMTJWgTJ+k5pB23MMzp+a?=
 =?us-ascii?Q?FbJ9j4LPNIvElX3tnC4BQaJHOQhZTxZ1cttQDWEl9LNOrkBTfHC7qkM/HBoX?=
 =?us-ascii?Q?R3Gbj5xW9Rsp693r1cxRC7rIp+1Zwp1I2cOZKLxHeCMQpVnbfjlFjB3RVp/F?=
 =?us-ascii?Q?jgxP9gbylaiiehx6bYYqD/AhH7eUqWrVhv7yuIFGMfzCRZyW75hzjpCb0lKn?=
 =?us-ascii?Q?bcZGObtiAOho+wxRKrMyjDw2zBOVEoxUGwz8m1d/TUPG4+DG1NjZ2tkC/x/n?=
 =?us-ascii?Q?1/ChbjofM2b+I9vG4y56RvsZVnVCgIsPJrnoBVV5WjuX7IAAUou/HyVOxrBR?=
 =?us-ascii?Q?HR332JJyeNCpZFLl39GvsldHItm3l7PAyfHU/eS2nRRG6H0CWWdpWNS/t/sa?=
 =?us-ascii?Q?yDzyAxYHkktDWBE+NU6xahn6B9rZcaaJoClsGyjY3iAAelVg4UE22xrw3dZO?=
 =?us-ascii?Q?DgJYZCMsG4qzEPn067P4pdYDSyM8onjz+9QOhXKWSETusW9oSSl5mxjyJKwb?=
 =?us-ascii?Q?NAwPlycoc1/IgIlwfAl76C7HXkYuj8K3kji70///y8RNfm2jIet4wWYsBQ2U?=
 =?us-ascii?Q?aYLtWD6034XYl2eaeztZwZxanhNXRqhce7N6bMmFbsBX1/dSqefz4ep3RHJp?=
 =?us-ascii?Q?AE9RzpR+I65pgxCOYK+OjSjMuqvzI7fLtow7E/S2EbJZeuw1EbLkO5+DfTW0?=
 =?us-ascii?Q?Hlj7R/gsTk3zhze+IcN3HDQjLihGKB7OWygpKESjj5zbdcwdjOkh3HQoA6iK?=
 =?us-ascii?Q?UUDpciVEZH5myqy12pcZyzjsi+cJk9ueA6YVzk/4WAZKpjgq7SgfJgbn+u16?=
 =?us-ascii?Q?iM+LN0t4AX7Gp7tFJDYKjvwZFBlS7kBI81yo3k8hXEtJrOvfmUmDIHR+imAs?=
 =?us-ascii?Q?XMcCyojBLn2sIH1VqD3LUhKE14KMs6BesWviCZgm+b8FYa1Ir9G3qf9VvHdY?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df4e928-6f01-44d0-d7f2-08dc4786b034
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 20:04:59.0132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yy7VuIjexvgCVqIjqgG0SVzuM5EtKVkHI49XF4xSCTpIBNXaLF33ZdQ5cjC0OuX9nl5b/xVqweC5L8d5xctKsACV4tvK+vyKFbJAPteQ5mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB6290
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 20:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109412

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

---
 .../bluez-tools/fix-memory-leaks.patch        | 768 ++++++++++++++++++
 .../obex-file-fix-null-check.patch            |  41 +
 .../bluez-tools/bluez-tools_git.bb            |  24 +
 3 files changed, 833 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/bluez-tools/bluez-=
tools/fix-memory-leaks.patch
 create mode 100644 meta-networking/recipes-connectivity/bluez-tools/bluez-=
tools/obex-file-fix-null-check.patch
 create mode 100644 meta-networking/recipes-connectivity/bluez-tools/bluez-=
tools_git.bb

diff --git a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools/f=
ix-memory-leaks.patch b/meta-networking/recipes-connectivity/bluez-tools/bl=
uez-tools/fix-memory-leaks.patch
new file mode 100644
index 000000000..22e1fac85
--- /dev/null
+++ b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools/fix-memo=
ry-leaks.patch
@@ -0,0 +1,768 @@
+Upstream-Status: Submitted [https://github.com/khvzak/bluez-tools/pull/48]
+
+From e5db2eec2591f0109f0eb7c2631055210b55f2f5 Mon Sep 17 00:00:00 2001
+Message-Id: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joerg=
.sommer@navimatix.de>
+From: thatlittlegit <personal@thatlittlegit.tk>
+Date: Sat, 7 Nov 2020 01:07:24 -0500
+Subject: [PATCH 1/9] Remove memory leaks and overall restructure
+ manager_find_adapter
+
+---
+ src/lib/manager.c | 61 +++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 43 insertions(+), 18 deletions(-)
+
+diff --git a/src/lib/manager.c b/src/lib/manager.c
+index 5286a3a..2263afc 100644
+--- a/src/lib/manager.c
++++ b/src/lib/manager.c
+@@ -136,43 +136,68 @@ const gchar *manager_find_adapter(Manager *self, con=
st gchar *pattern, GError **
+     GVariant *ifaces_and_properties;
+     GVariantIter i;
+=20
++    gchar *pattern_lowercase =3D g_ascii_strdown(pattern, -1);
++
+     g_variant_iter_init(&i, objects);
+-    while (g_variant_iter_next(&i, "{&o@a{sa{sv}}}", &object_path, &iface=
s_and_properties))
++    gboolean still_looking =3D TRUE;
++    while (still_looking && g_variant_iter_next(&i, "{&o@a{sa{sv}}}", &ob=
ject_path, &ifaces_and_properties))
+     {
+         const gchar *interface_name;
+-        GVariant *properties;
+         GVariantIter ii;
++        GVariant* properties;
+         g_variant_iter_init(&ii, ifaces_and_properties);
+         while (g_variant_iter_next(&ii, "{&s@a{sv}}", &interface_name, &p=
roperties))
+         {
+-            if (g_strstr_len(g_ascii_strdown(interface_name, -1), -1, "ad=
apter"))
++            gchar *interface_name_lowercase =3D g_ascii_strdown(interface=
_name, -1);
++            if (strstr(interface_name_lowercase, "adapter"))
+             {
+-                const gchar *object_base_name =3D g_path_get_basename(obj=
ect_path);
+-                if (g_strstr_len(g_ascii_strdown(object_base_name, -1), -=
1, g_ascii_strdown(pattern, -1)))
++                g_free(interface_name_lowercase);
++
++                gchar *object_base_name_original =3D g_path_get_basename(=
object_path);
++                gchar *object_base_name =3D g_ascii_strdown(interface_nam=
e, -1);
++                g_free(object_base_name_original);
++
++                if (strstr(object_base_name, pattern_lowercase))
+                 {
+-                    const gchar *retVal =3D g_strdup(object_path);
+-                    g_variant_unref(properties);
+-                    g_variant_unref(ifaces_and_properties);
+-                    g_variant_unref(objects);
+-                    return retVal;
++                    still_looking =3D FALSE;
++                    g_free(object_base_name);
++                    break;
+                 }
+-                const gchar *address =3D g_variant_get_string(g_variant_l=
ookup_value(properties, "Address", NULL), NULL);
+-                if (g_strstr_len(g_ascii_strdown(address, -1), -1, g_asci=
i_strdown(pattern, -1)))
++
++                g_free(object_base_name);
++
++                const gchar *address_original =3D g_variant_get_string(g_=
variant_lookup_value(properties, "Address", NULL), NULL);
++                gchar *address =3D g_ascii_strdown(address_original, -1);
++
++                if (strstr(address, pattern_lowercase))
+                 {
+-                    gchar *retVal =3D g_strdup(object_path);
+-                    g_variant_unref(properties);
+-                    g_variant_unref(ifaces_and_properties);
+-                    g_variant_unref(objects);
+-                    return retVal;
++                    still_looking =3D FALSE;
++                    g_free(address);
++                    break;
+                 }
++                g_free(address);
+             }
++            else
++            {
++                g_free(interface_name_lowercase);
++            }
++
+             g_variant_unref(properties);
+         }
++
+         g_variant_unref(ifaces_and_properties);
+     }
+     g_variant_unref(objects);
++    g_free(pattern_lowercase);
+=20
+-    return NULL;
++    if (still_looking)
++    {
++        return NULL;
++    }
++    else
++    {
++        return object_path;
++    }
+ }
+=20
+ GPtrArray *manager_get_adapters(Manager *self)
+--=20
+2.34.1
+
+
+From 163fcc94f1bc7c8f238e78adb03af914a566d979 Mon Sep 17 00:00:00 2001
+Message-Id: <163fcc94f1bc7c8f238e78adb03af914a566d979.1710791277.git.joerg=
.sommer@navimatix.de>
+In-Reply-To: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joer=
g.sommer@navimatix.de>
+References: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joerg=
.sommer@navimatix.de>
+From: thatlittlegit <personal@thatlittlegit.tk>
+Date: Sat, 7 Nov 2020 22:12:21 -0500
+Subject: [PATCH 2/9] Replace manager_default_adapter with
+ manager_find_adapter(..., NULL, ...)
+
+---
+ src/lib/helpers.c | 57 ++++++++++++++++++-----------------------------
+ src/lib/manager.c | 51 +++++++++---------------------------------
+ src/lib/manager.h |  1 -
+ 3 files changed, 33 insertions(+), 76 deletions(-)
+
+diff --git a/src/lib/helpers.c b/src/lib/helpers.c
+index d7e95f9..99561b5 100644
+--- a/src/lib/helpers.c
++++ b/src/lib/helpers.c
+@@ -159,52 +159,39 @@ Adapter *find_adapter(const gchar *name, GError **er=
ror)
+=20
+     Manager *manager =3D g_object_new(MANAGER_TYPE, NULL);
+=20
+-    // If name is null or empty - return default adapter
+-    if (name =3D=3D NULL || strlen(name) =3D=3D 0)
++    // Try to find by id
++    adapter_path =3D (gchar *) manager_find_adapter(manager, name, error)=
;
++
++    // Found
++    if (adapter_path)
+     {
+-        adapter_path =3D (gchar *) manager_default_adapter(manager, error=
);
+-        if (adapter_path)
+-        {
+-            // adapter =3D g_object_new(ADAPTER_TYPE, "DBusObjectPath", a=
dapter_path, NULL);
+-            adapter =3D adapter_new(adapter_path);
+-        }
++        // adapter =3D g_object_new(ADAPTER_TYPE, "DBusObjectPath", adapt=
er_path, NULL);
++        adapter =3D adapter_new(adapter_path);
+     }
+     else
+     {
+-        // Try to find by id
+-        adapter_path =3D (gchar *) manager_find_adapter(manager, name, er=
ror);
+-
+-        // Found
+-        if (adapter_path)
++        // Try to find by name
++        const GPtrArray *adapters_list =3D manager_get_adapters(manager);
++        g_assert(adapters_list !=3D NULL);
++        for (int i =3D 0; i < adapters_list->len; i++)
+         {
++            adapter_path =3D g_ptr_array_index(adapters_list, i);
+             // adapter =3D g_object_new(ADAPTER_TYPE, "DBusObjectPath", a=
dapter_path, NULL);
+             adapter =3D adapter_new(adapter_path);
+-        }
+-        else
+-        {
+-            // Try to find by name
+-            const GPtrArray *adapters_list =3D manager_get_adapters(manag=
er);
+-            g_assert(adapters_list !=3D NULL);
+-            for (int i =3D 0; i < adapters_list->len; i++)
++            adapter_path =3D NULL;
++
++            if (g_strcmp0(name, adapter_get_name(adapter, error)) =3D=3D =
0)
+             {
+-                adapter_path =3D g_ptr_array_index(adapters_list, i);
+-                // adapter =3D g_object_new(ADAPTER_TYPE, "DBusObjectPath=
", adapter_path, NULL);
+-                adapter =3D adapter_new(adapter_path);
+-                adapter_path =3D NULL;
+-
+-                if (g_strcmp0(name, adapter_get_name(adapter, error)) =3D=
=3D 0)
++                if (*error)
+                 {
+-                    if (error)
+-                    {
+-                        g_error_free(*error);
+-                        *error =3D NULL;
+-                    }
+-                    break;
++                    g_error_free(*error);
++                    *error =3D NULL;
+                 }
+-
+-                g_object_unref(adapter);
+-                adapter =3D NULL;
++                break;
+             }
++
++            g_object_unref(adapter);
++            adapter =3D NULL;
+         }
+     }
+=20
+diff --git a/src/lib/manager.c b/src/lib/manager.c
+index 2263afc..891fc45 100644
+--- a/src/lib/manager.c
++++ b/src/lib/manager.c
+@@ -84,45 +84,6 @@ GVariant *manager_get_managed_objects(Manager *self, GE=
rror **error)
+     return retVal;
+ }
+=20
+-const gchar *manager_default_adapter(Manager *self, GError **error)
+-{
+-    g_assert(MANAGER_IS(self));
+-
+-    GVariant *objects =3D NULL;
+-    objects =3D manager_get_managed_objects(self, error);
+-    if (objects =3D=3D NULL)
+-        return NULL;
+-
+-    const gchar *object_path;
+-    GVariant *ifaces_and_properties;
+-    GVariantIter i;
+-
+-    g_variant_iter_init(&i, objects);
+-    while (g_variant_iter_next(&i, "{&o@a{sa{sv}}}", &object_path, &iface=
s_and_properties))
+-    {
+-        const gchar *interface_name;
+-        GVariant *properties;
+-        GVariantIter ii;
+-        g_variant_iter_init(&ii, ifaces_and_properties);
+-        while (g_variant_iter_next(&ii, "{&s@a{sv}}", &interface_name, &p=
roperties))
+-        {
+-            if (g_strstr_len(g_ascii_strdown(interface_name, -1), -1, "ad=
apter"))
+-            {
+-                const gchar *retVal =3D g_strdup(object_path);
+-                g_variant_unref(properties);
+-                g_variant_unref(ifaces_and_properties);
+-                g_variant_unref(objects);
+-                return retVal;
+-            }
+-            g_variant_unref(properties);
+-        }
+-        g_variant_unref(ifaces_and_properties);
+-    }
+-    g_variant_unref(objects);
+-
+-    return NULL;
+-}
+-
+ const gchar *manager_find_adapter(Manager *self, const gchar *pattern, GE=
rror **error)
+ {
+     g_assert(MANAGER_IS(self));
+@@ -136,7 +97,11 @@ const gchar *manager_find_adapter(Manager *self, const=
 gchar *pattern, GError **
+     GVariant *ifaces_and_properties;
+     GVariantIter i;
+=20
+-    gchar *pattern_lowercase =3D g_ascii_strdown(pattern, -1);
++    gchar *pattern_lowercase =3D NULL;
++    if (pattern !=3D NULL)
++    {
++        pattern_lowercase =3D g_ascii_strdown(pattern, -1);
++    }
+=20
+     g_variant_iter_init(&i, objects);
+     gboolean still_looking =3D TRUE;
+@@ -153,6 +118,12 @@ const gchar *manager_find_adapter(Manager *self, cons=
t gchar *pattern, GError **
+             {
+                 g_free(interface_name_lowercase);
+=20
++                if (!pattern_lowercase)
++                {
++                    still_looking =3D FALSE;
++                    break;
++                }
++
+                 gchar *object_base_name_original =3D g_path_get_basename(=
object_path);
+                 gchar *object_base_name =3D g_ascii_strdown(interface_nam=
e, -1);
+                 g_free(object_base_name_original);
+diff --git a/src/lib/manager.h b/src/lib/manager.h
+index 0c9e052..b651812 100644
+--- a/src/lib/manager.h
++++ b/src/lib/manager.h
+@@ -54,7 +54,6 @@ extern "C" {
+      * Method definitions.
+      */
+     GVariant *manager_get_managed_objects(Manager *self, GError **error);
+-    const gchar *manager_default_adapter(Manager *self, GError **error);
+     const gchar *manager_find_adapter(Manager *self, const gchar *pattern=
, GError **error);
+     GPtrArray *manager_get_adapters(Manager *self);
+     const gchar **manager_get_devices(Manager *self, const gchar *adapter=
_pattern);
+--=20
+2.34.1
+
+
+From b463d9cfc2390ca6352c16e6f6e113cf42d0f688 Mon Sep 17 00:00:00 2001
+Message-Id: <b463d9cfc2390ca6352c16e6f6e113cf42d0f688.1710791277.git.joerg=
.sommer@navimatix.de>
+In-Reply-To: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joer=
g.sommer@navimatix.de>
+References: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joerg=
.sommer@navimatix.de>
+From: thatlittlegit <personal@thatlittlegit.tk>
+Date: Sat, 7 Nov 2020 23:38:42 -0500
+Subject: [PATCH 3/9] Fix remaining g_ascii_strdown leaks
+
+---
+ src/lib/helpers.c    | 2 +-
+ src/lib/manager.c    | 5 ++++-
+ src/lib/properties.c | 4 ++--
+ 3 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/src/lib/helpers.c b/src/lib/helpers.c
+index 99561b5..b61bc07 100644
+--- a/src/lib/helpers.c
++++ b/src/lib/helpers.c
+@@ -242,7 +242,7 @@ Device *find_device(Adapter *adapter, const gchar *nam=
e, GError **error)
+                    =20
+                     if(g_variant_lookup(properties, "Address", "s", &addr=
ess))
+                     {
+-                        if(g_strcmp0(g_ascii_strdown(address, -1), g_asci=
i_strdown(name, -1)) =3D=3D 0)
++                        if(name && address && g_ascii_strcasecmp(address,=
 name) =3D=3D 0)
+                         {
+                             device =3D device_new(object_path);
+                         }
+diff --git a/src/lib/manager.c b/src/lib/manager.c
+index 891fc45..d506ae6 100644
+--- a/src/lib/manager.c
++++ b/src/lib/manager.c
+@@ -200,8 +200,11 @@ GPtrArray *manager_get_adapters(Manager *self)
+         g_variant_iter_init(&ii, ifaces_and_properties);
+         while (g_variant_iter_next(&ii, "{&s@a{sv}}", &interface_name, &p=
roperties))
+         {
+-            if (g_strstr_len(g_ascii_strdown(interface_name, -1), -1, "ad=
apter"))
++            char* interface_name_lowercase =3D g_ascii_strdown(interface_=
name, -1);
++            if (strstr(interface_name_lowercase, "adapter"))
+                 g_ptr_array_add(adapter_array, (gpointer) g_strdup(object=
_path));
++
++            g_free(interface_name_lowercase);
+             g_variant_unref(properties);
+         }
+         g_variant_unref(ifaces_and_properties);
+diff --git a/src/lib/properties.c b/src/lib/properties.c
+index 8b913d5..70a7640 100644
+--- a/src/lib/properties.c
++++ b/src/lib/properties.c
+@@ -205,12 +205,12 @@ static void _properties_create_gdbus_proxy(Propertie=
s *self, GError **error)
+ {
+     if(self->priv->dbus_type && self->priv->dbus_service_name && self->pr=
iv->dbus_object_path)
+     {
+-        if(g_ascii_strcasecmp(g_ascii_strdown(self->priv->dbus_type, -1),=
 "system") =3D=3D 0)
++        if(g_ascii_strcasecmp(self->priv->dbus_type, "system") =3D=3D 0)
+         {
+             g_assert(system_conn !=3D NULL);
+             self->priv->proxy =3D g_dbus_proxy_new_sync(system_conn, G_DB=
US_PROXY_FLAGS_NONE, NULL, self->priv->dbus_service_name, self->priv->dbus_=
object_path, PROPERTIES_DBUS_INTERFACE, NULL, error);
+         }
+-        else if(g_ascii_strcasecmp(g_ascii_strdown(self->priv->dbus_type,=
 -1), "session") =3D=3D 0)
++        else if(g_ascii_strcasecmp(self->priv->dbus_type, "session") =3D=
=3D 0)
+         {
+             g_assert(session_conn !=3D NULL);
+             self->priv->proxy =3D g_dbus_proxy_new_sync(session_conn, G_D=
BUS_PROXY_FLAGS_NONE, NULL, self->priv->dbus_service_name, self->priv->dbus=
_object_path, PROPERTIES_DBUS_INTERFACE, NULL, error);
+--=20
+2.34.1
+
+
+From 7ca191164a3a3d8867b1a4af7cd349dc53569fa3 Mon Sep 17 00:00:00 2001
+Message-Id: <7ca191164a3a3d8867b1a4af7cd349dc53569fa3.1710791277.git.joerg=
.sommer@navimatix.de>
+In-Reply-To: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joer=
g.sommer@navimatix.de>
+References: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joerg=
.sommer@navimatix.de>
+From: thatlittlegit <personal@thatlittlegit.tk>
+Date: Sun, 8 Nov 2020 14:04:36 -0500
+Subject: [PATCH 4/9] Don't leak g_variant_lookup_value results in bt-obex
+
+---
+ src/bt-obex.c | 23 ++++++++++++++++-------
+ 1 file changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/src/bt-obex.c b/src/bt-obex.c
+index 8aacb40..0f044a5 100644
+--- a/src/bt-obex.c
++++ b/src/bt-obex.c
+@@ -213,15 +213,24 @@ static void _obex_opp_client_object_manager_handler(=
GDBusConnection *connection,
+             g_hash_table_insert(_transfers, g_strdup(interface_object_pat=
h), t);
+=20
+             ObexTransferInfo *info =3D g_malloc0(sizeof(ObexTransferInfo)=
);
+-            info->filesize =3D g_variant_get_uint64(g_variant_lookup_valu=
e(properties, "Size", NULL));
+-            info->filename =3D g_strdup(g_variant_get_string(g_variant_lo=
okup_value(properties, "Name", NULL), NULL));
+-            info->status =3D g_strdup(g_variant_get_string(g_variant_look=
up_value(properties, "Status", NULL), NULL));
+-            ObexSession *session =3D obex_session_new(g_variant_get_strin=
g(g_variant_lookup_value(properties, "Session", NULL), NULL));
+-           =20
++
++            GVariant* size_variant =3D g_variant_lookup_value(properties,=
 "Size", NULL);
++            GVariant* name_variant =3D g_variant_lookup_value(properties,=
 "Name", NULL);
++            GVariant* status_variant =3D g_variant_lookup_value(propertie=
s, "Status", NULL);
++            GVariant* session_variant =3D g_variant_lookup_value(properti=
es, "Session", NULL);
++
++            info->filesize =3D g_variant_get_uint64(size_variant);
++            info->filename =3D g_variant_dup_string(name_variant, NULL);
++            info->status =3D g_variant_dup_string(status_variant, NULL);
++            ObexSession *session =3D obex_session_new(g_variant_get_strin=
g(session_variant, NULL));
+             info->obex_root =3D g_strdup(obex_session_get_root(session, N=
ULL));
+-           =20
++
++            g_variant_unref(size_variant);
++            g_variant_unref(name_variant);
++            g_variant_unref(status_variant);
++            g_variant_unref(session_variant);
+             g_object_unref(session);
+-           =20
++
+             g_hash_table_insert(_transfer_infos, g_strdup(interface_objec=
t_path), info);
+             if(g_strcmp0(info->status, "queued") =3D=3D 0)
+                 g_print("[Transfer#%s] Waiting...\n", info->filename);
+--=20
+2.34.1
+
+
+From 7100380b710b36f8e31748ac5bf0e6ffb7c4eed7 Mon Sep 17 00:00:00 2001
+Message-Id: <7100380b710b36f8e31748ac5bf0e6ffb7c4eed7.1710791277.git.joerg=
.sommer@navimatix.de>
+In-Reply-To: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joer=
g.sommer@navimatix.de>
+References: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joerg=
.sommer@navimatix.de>
+From: thatlittlegit <personal@thatlittlegit.tk>
+Date: Thu, 12 Nov 2020 21:41:55 -0500
+Subject: [PATCH 5/9] Correctly free temporary values in bt-obex
+
+---
+ src/bt-obex.c     | 35 +++++++++++++++++++++++++----------
+ src/lib/helpers.c |  3 ++-
+ 2 files changed, 27 insertions(+), 11 deletions(-)
+
+diff --git a/src/bt-obex.c b/src/bt-obex.c
+index 0f044a5..547186b 100644
+--- a/src/bt-obex.c
++++ b/src/bt-obex.c
+@@ -70,25 +70,32 @@ static void _obex_server_object_manager_handler(GDBusC=
onnection *connection, con
+         const gchar *interface_object_path =3D g_variant_get_string(g_var=
iant_get_child_value(parameters, 0), NULL);
+         GVariant *interfaces_and_properties =3D g_variant_get_child_value=
(parameters, 1);
+         GVariant *properties =3D NULL;
+-       =20
++
+         if(g_variant_lookup(interfaces_and_properties, OBEX_TRANSFER_DBUS=
_INTERFACE, "@a{sv}", &properties))
+         {
+             g_print("[OBEX Server] Transfer started\n");
+             ObexTransfer *t =3D obex_transfer_new(interface_object_path);
+             g_hash_table_insert(_transfers, g_strdup(interface_object_pat=
h), t);
+-           =20
++
++            GVariant* size_variant =3D g_variant_lookup_value(properties,=
 "Size", NULL);
++            GVariant* status_variant =3D g_variant_lookup_value(propertie=
s, "Status", NULL);
++            GVariant* session_variant =3D g_variant_lookup_value(properti=
es, "Session", NULL);
++
+             ObexTransferInfo *info =3D g_malloc0(sizeof(ObexTransferInfo)=
);
+-            info->filesize =3D g_variant_get_uint64(g_variant_lookup_valu=
e(properties, "Size", NULL));
+-            info->status =3D g_strdup(g_variant_get_string(g_variant_look=
up_value(properties, "Status", NULL), NULL));
+-            ObexSession *session =3D obex_session_new(g_variant_get_strin=
g(g_variant_lookup_value(properties, "Session", NULL), NULL));
+-           =20
++            info->filesize =3D g_variant_get_uint64(size_variant);
++            info->status =3D g_strdup(g_variant_get_string(status_variant=
, NULL));
++
++            ObexSession *session =3D obex_session_new(g_variant_get_strin=
g(session_variant, NULL));
+             info->obex_root =3D g_strdup(obex_session_get_root(session, N=
ULL));
+-           =20
+             g_object_unref(session);
++
++            g_variant_unref(size_variant);
++            g_variant_unref(status_variant);
++            g_variant_unref(session_variant);
+            =20
+             g_hash_table_insert(_transfer_infos, g_strdup(interface_objec=
t_path), info);
+         }
+-       =20
++
+         if(g_variant_lookup(interfaces_and_properties, OBEX_SESSION_DBUS_=
INTERFACE, "@a{sv}", &properties))
+         {
+             g_print("[OBEX Server] OBEX session opened\n");
+@@ -177,7 +184,12 @@ static void _obex_server_properties_handler(GDBusConn=
ection *connection, const g
+             {
+                 g_print("[OBEX Server] Transfer succeeded\n");
+                 ObexTransferInfo *info =3D g_hash_table_lookup(_transfer_=
infos, object_path);
+-                g_rename(g_build_filename(info->obex_root, info->filename=
, NULL), g_build_filename(_root_path, info->filename, NULL));
++
++                gchar* old_name =3D g_build_filename(info->obex_root, inf=
o->filename, NULL);
++                gchar* new_name =3D g_build_filename(_root_path, info->fi=
lename, NULL);
++                g_rename(old_name, new_name);
++                g_free(old_name);
++                g_free(new_name);
+             }
+             else if(g_strcmp0(status, "error") =3D=3D 0)
+             {
+@@ -202,7 +214,8 @@ static void _obex_opp_client_object_manager_handler(GD=
BusConnection *connection,
+ {
+     if(g_strcmp0(signal_name, "InterfacesAdded") =3D=3D 0)
+     {
+-        const gchar *interface_object_path =3D g_variant_get_string(g_var=
iant_get_child_value(parameters, 0), NULL);
++        GVariant* interface_value =3D g_variant_get_child_value(parameter=
s, 0);
++        const gchar *interface_object_path =3D g_variant_get_string(inter=
face_value, NULL);
+         GVariant *interfaces_and_properties =3D g_variant_get_child_value=
(parameters, 1);
+         GVariant *properties =3D NULL;
+        =20
+@@ -242,6 +255,8 @@ static void _obex_opp_client_object_manager_handler(GD=
BusConnection *connection,
+         }
+        =20
+         g_variant_unref(interfaces_and_properties);
++        g_variant_unref(interface_value);
++
+         if(properties)
+             g_variant_unref(properties);
+     }
+diff --git a/src/lib/helpers.c b/src/lib/helpers.c
+index b61bc07..d9e2257 100644
+--- a/src/lib/helpers.c
++++ b/src/lib/helpers.c
+@@ -171,7 +171,7 @@ Adapter *find_adapter(const gchar *name, GError **erro=
r)
+     else
+     {
+         // Try to find by name
+-        const GPtrArray *adapters_list =3D manager_get_adapters(manager);
++        GPtrArray *adapters_list =3D manager_get_adapters(manager);
+         g_assert(adapters_list !=3D NULL);
+         for (int i =3D 0; i < adapters_list->len; i++)
+         {
+@@ -193,6 +193,7 @@ Adapter *find_adapter(const gchar *name, GError **erro=
r)
+             g_object_unref(adapter);
+             adapter =3D NULL;
+         }
++        g_ptr_array_unref(adapters_list);
+     }
+=20
+     g_object_unref(manager);
+--=20
+2.34.1
+
+
+From 860fb6e19a7bc272722c36a980004044bc9906e5 Mon Sep 17 00:00:00 2001
+Message-Id: <860fb6e19a7bc272722c36a980004044bc9906e5.1710791277.git.joerg=
.sommer@navimatix.de>
+In-Reply-To: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joer=
g.sommer@navimatix.de>
+References: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joerg=
.sommer@navimatix.de>
+From: thatlittlegit <personal@thatlittlegit.tk>
+Date: Thu, 12 Nov 2020 21:45:51 -0500
+Subject: [PATCH 6/9] Use g_hash_table_new_full() instead of manual freeing
+
+---
+ src/bt-obex.c | 56 +++++++++++++++++----------------------------------
+ 1 file changed, 18 insertions(+), 38 deletions(-)
+
+diff --git a/src/bt-obex.c b/src/bt-obex.c
+index 547186b..413c12d 100644
+--- a/src/bt-obex.c
++++ b/src/bt-obex.c
+@@ -55,6 +55,14 @@ struct _ObexTransferInfo {
+     gchar *status;
+ };
+=20
++static void obex_transfer_info_free(ObexTransferInfo* info)
++{
++    g_free(info->filename);
++    g_free(info->obex_root);
++    g_free(info->status);
++    g_free(info);
++}
++
+ static void sigterm_handler(int sig)
+ {
+     g_message("%s received", sig =3D=3D SIGTERM ? "SIGTERM" : "SIGINT");
+@@ -117,10 +125,7 @@ static void _obex_server_object_manager_handler(GDBus=
Connection *connection, con
+             if(g_strcmp0(*inf, OBEX_TRANSFER_DBUS_INTERFACE) =3D=3D 0)
+             {
+                 g_print("[OBEX Server] OBEX transfer closed\n");
+-                ObexTransfer *transfer =3D g_hash_table_lookup(_transfers=
, interface_object_path);
+                 g_hash_table_remove(_transfers, interface_object_path);
+-                g_object_unref(transfer);
+-                g_free(g_hash_table_lookup(_transfer_infos, interface_obj=
ect_path));
+                 g_hash_table_remove(_transfer_infos, interface_object_pat=
h);
+             }
+            =20
+@@ -272,10 +277,7 @@ static void _obex_opp_client_object_manager_handler(G=
DBusConnection *connection,
+             if(g_strcmp0(*inf, OBEX_TRANSFER_DBUS_INTERFACE) =3D=3D 0)
+             {
+                 // g_print("[OBEX Client] OBEX transfer closed\n");
+-                ObexTransfer *transfer =3D g_hash_table_lookup(_transfers=
, interface_object_path);
+                 g_hash_table_remove(_transfers, interface_object_path);
+-                g_object_unref(transfer);
+-                g_free(g_hash_table_lookup(_transfer_infos, interface_obj=
ect_path));
+                 g_hash_table_remove(_transfer_infos, interface_object_pat=
h);
+                 if (g_main_loop_is_running(mainloop))
+                     g_main_loop_quit(mainloop);
+@@ -514,8 +516,8 @@ int main(int argc, char *argv[])
+             exit_if_error(error);
+         }
+=20
+-        _transfers =3D g_hash_table_new(g_str_hash, g_str_equal);
+-        _transfer_infos =3D g_hash_table_new(g_str_hash, g_str_equal);
++        _transfers =3D g_hash_table_new_full(g_str_hash, g_str_equal, g_f=
ree, g_object_unref);
++        _transfer_infos =3D g_hash_table_new_full(g_str_hash, g_str_equal=
, g_free, (GDestroyNotify)obex_transfer_info_free);
+=20
+         ObexAgentManager *manager =3D obex_agent_manager_new();
+        =20
+@@ -552,21 +554,10 @@ int main(int argc, char *argv[])
+         g_hash_table_iter_init(&iter, _transfers);
+         while (g_hash_table_iter_next(&iter, &key, &value))
+         {
+-            ObexTransfer *t =3D OBEX_TRANSFER(value);
+-            obex_transfer_cancel(t, NULL); // skip errors
+-            g_object_unref(t);
+-            g_hash_table_iter_remove(&iter);
+-        }
+-        g_hash_table_unref(_transfers);
+-       =20
+-        // Remove transfer information
+-        g_hash_table_iter_init(&iter, _transfer_infos);
+-        while (g_hash_table_iter_next(&iter, &key, &value))
+-        {
+-            g_free(value);
+-            g_hash_table_iter_remove(&iter);
++            obex_transfer_cancel(OBEX_TRANSFER(value), NULL);
+         }
+         g_hash_table_unref(_transfers);
++        g_hash_table_unref(_transfer_infos);
+=20
+         g_dbus_connection_signal_unsubscribe(session_conn, obex_server_ob=
ject_id);
+         g_dbus_connection_signal_unsubscribe(session_conn, obex_server_pr=
operties_id);
+@@ -588,8 +579,8 @@ int main(int argc, char *argv[])
+             exit_if_error(error);
+         }
+        =20
+-        _transfers =3D g_hash_table_new(g_str_hash, g_str_equal);
+-        _transfer_infos =3D g_hash_table_new(g_str_hash, g_str_equal);
++        _transfers =3D g_hash_table_new_full(g_str_hash, g_str_equal, g_f=
ree, g_object_unref);
++        _transfer_infos =3D g_hash_table_new_full(g_str_hash, g_str_equal=
, g_free, g_free);
+=20
+         gchar * files_to_send[] =3D {NULL, NULL};
+         files_to_send[0] =3D g_path_is_absolute(opp_file_arg) ? g_strdup(=
opp_file_arg) : get_absolute_path(opp_file_arg);
+@@ -663,24 +654,13 @@ int main(int argc, char *argv[])
+         g_hash_table_iter_init(&iter, _transfers);
+         while (g_hash_table_iter_next(&iter, &key, &value))
+         {
+-            ObexTransfer *t =3D OBEX_TRANSFER(value);
+-            obex_transfer_cancel(t, NULL); // skip errors
+-            g_object_unref(t);
+-            g_hash_table_iter_remove(&iter);
++            obex_transfer_cancel(OBEX_TRANSFER(value), NULL);
+         }
+         g_hash_table_unref(_transfers);
+-       =20
+-        // Remove transfer information objects
+-        g_hash_table_iter_init(&iter, _transfer_infos);
+-        while (g_hash_table_iter_next(&iter, &key, &value))
+-        {
+-            g_free(value);
+-            g_hash_table_iter_remove(&iter);
+-        }
+-        g_hash_table_unref(_transfers);
+-       =20
+-        g_object_unref(client);
+=20
++        g_hash_table_unref(_transfer_infos);
++        g_object_unref(client);
++        g_object_unref(session);
+         g_variant_unref(device_dict);
+=20
+         g_free(src_address);
+--=20
+2.34.1
+
+
+From 9804eb7e5996c52cc542eef59ba3b5f4d0b0b2f9 Mon Sep 17 00:00:00 2001
+Message-Id: <9804eb7e5996c52cc542eef59ba3b5f4d0b0b2f9.1710791277.git.joerg=
.sommer@navimatix.de>
+In-Reply-To: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joer=
g.sommer@navimatix.de>
+References: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joerg=
.sommer@navimatix.de>
+From: thatlittlegit <personal@thatlittlegit.tk>
+Date: Thu, 12 Nov 2020 21:51:34 -0500
+Subject: [PATCH 7/9] Don't set filesize if we don't know the size
+
+I only meant to fix the g_variant_unref warning, but fixing all of them
+works too!
+---
+ src/bt-obex.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/bt-obex.c b/src/bt-obex.c
+index 413c12d..219d458 100644
+--- a/src/bt-obex.c
++++ b/src/bt-obex.c
+@@ -90,14 +90,22 @@ static void _obex_server_object_manager_handler(GDBusC=
onnection *connection, con
+             GVariant* session_variant =3D g_variant_lookup_value(properti=
es, "Session", NULL);
+=20
+             ObexTransferInfo *info =3D g_malloc0(sizeof(ObexTransferInfo)=
);
+-            info->filesize =3D g_variant_get_uint64(size_variant);
+             info->status =3D g_strdup(g_variant_get_string(status_variant=
, NULL));
+=20
+             ObexSession *session =3D obex_session_new(g_variant_get_strin=
g(session_variant, NULL));
+             info->obex_root =3D g_strdup(obex_session_get_root(session, N=
ULL));
+             g_object_unref(session);
+=20
+-            g_variant_unref(size_variant);
++            if (size_variant !=3D NULL)
++            {
++                info->filesize =3D g_variant_get_uint64(size_variant);
++                g_variant_unref(size_variant);
++            }
++            else
++            {
++                info->filesize =3D 0;
++            }
++
+             g_variant_unref(status_variant);
+             g_variant_unref(session_variant);
+            =20
+--=20
+2.34.1
+
+
+From 9566f84464d486983ec597945bc4d5d1594ed830 Mon Sep 17 00:00:00 2001
+Message-Id: <9566f84464d486983ec597945bc4d5d1594ed830.1710791277.git.joerg=
.sommer@navimatix.de>
+In-Reply-To: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joer=
g.sommer@navimatix.de>
+References: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joerg=
.sommer@navimatix.de>
+From: thatlittlegit <personal@thatlittlegit.tk>
+Date: Sun, 15 Nov 2020 16:18:36 -0500
+Subject: [PATCH 8/9] Fix a use-after-free in bt-obex
+
+---
+ src/bt-obex.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bt-obex.c b/src/bt-obex.c
+index 219d458..7dc5d6b 100644
+--- a/src/bt-obex.c
++++ b/src/bt-obex.c
+@@ -626,7 +626,7 @@ int main(int argc, char *argv[])
+         mainloop =3D g_main_loop_new(NULL, FALSE);
+=20
+         ObexClient *client =3D obex_client_new();
+-        const gchar *session_path =3D obex_client_create_session(client, =
dst_address, device_dict, &error);
++        const gchar *session_path =3D obex_client_create_session(client, =
dst_address, g_variant_ref(device_dict), &error);
+         exit_if_error(error);
+         ObexSession *session =3D obex_session_new(session_path);
+         ObexObjectPush *oop =3D obex_object_push_new(obex_session_get_dbu=
s_object_path(session));
+--=20
+2.34.1
+
+
+From 5271a4c6419b54a0b18070d39bfc69fae2819c00 Mon Sep 17 00:00:00 2001
+Message-Id: <5271a4c6419b54a0b18070d39bfc69fae2819c00.1710791277.git.joerg=
.sommer@navimatix.de>
+In-Reply-To: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joer=
g.sommer@navimatix.de>
+References: <e5db2eec2591f0109f0eb7c2631055210b55f2f5.1710791277.git.joerg=
.sommer@navimatix.de>
+From: thatlittlegit <personal@thatlittlegit.tk>
+Date: Sat, 21 Nov 2020 13:09:46 -0500
+Subject: [PATCH 9/9] Fix running sdptool if it isn't in $PATH
+
+---
+ src/bt-device.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/bt-device.c b/src/bt-device.c
+index a739b98..948a10c 100644
+--- a/src/bt-device.c
++++ b/src/bt-device.c
+@@ -331,9 +331,9 @@ static GHashTable *_bt_device_sdp_browse(const gchar *=
device_path, const gchar *
+         }
+        =20
+         if(pattern =3D=3D NULL || strlen(pattern) =3D=3D 0)
+-            execl("/bin/sdptool", "/bin/sdptool", "browse", "--xml", devi=
ce_path, (char *) 0);
++            execlp("sdptool", "sdptool", "browse", "--xml", device_path, =
(char *) 0);
+         else
+-            execl("/bin/sdptool", "/bin/sdptool", "browse", "--xml", "--u=
uid", pattern, device_path, (char *) 0);
++            execlp("sdptool", "sdptool", "browse", "--xml", "--uuid", pat=
tern, device_path, (char *) 0);
+        =20
+     }
+     if(pid =3D=3D -1)
+--=20
+2.34.1
+
diff --git a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools/o=
bex-file-fix-null-check.patch b/meta-networking/recipes-connectivity/bluez-=
tools/bluez-tools/obex-file-fix-null-check.patch
new file mode 100644
index 000000000..231f3b0b7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools/obex-fil=
e-fix-null-check.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Submitted [https://github.com/khvzak/bluez-tools/pull/47]
+
+From f9bc83d46f131037f7fa5195a506b65560199d0d Mon Sep 17 00:00:00 2001
+Message-Id: <f9bc83d46f131037f7fa5195a506b65560199d0d.1710791715.git.joerg=
.sommer@navimatix.de>
+From: George Talusan <george.talusan@gmail.com>
+Date: Mon, 26 Oct 2020 21:35:51 -0400
+Subject: [PATCH] fix null checks
+
+---
+ src/lib/bluez/obex/obex_file_transfer.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/bluez/obex/obex_file_transfer.c b/src/lib/bluez/obex/=
obex_file_transfer.c
+index 2d3dafe..91c41d6 100644
+--- a/src/lib/bluez/obex/obex_file_transfer.c
++++ b/src/lib/bluez/obex/obex_file_transfer.c
+@@ -194,7 +194,7 @@ GVariant *obex_file_transfer_get_file(ObexFileTransfer=
 *self, const gchar *targe
+ 	g_assert(OBEX_FILE_TRANSFER_IS(self));
+ 	GVariant *ret =3D NULL;
+ 	GVariant *proxy_ret =3D g_dbus_proxy_call_sync(self->priv->proxy, "GetFi=
le", g_variant_new ("(ss)", targetfile, sourcefile), G_DBUS_CALL_FLAGS_NONE=
, -1, NULL, error);
+-	if (proxy_ret !=3D NULL)
++	if (proxy_ret =3D=3D NULL)
+ 		return NULL;
+ 	ret =3D g_variant_ref_sink(proxy_ret);
+ 	g_variant_unref(proxy_ret);
+@@ -228,9 +228,9 @@ GVariant *obex_file_transfer_put_file(ObexFileTransfer=
 *self, const gchar *sourc
+ 	g_assert(OBEX_FILE_TRANSFER_IS(self));
+ 	GVariant *ret =3D NULL;
+ 	GVariant *proxy_ret =3D g_dbus_proxy_call_sync(self->priv->proxy, "PutFi=
le", g_variant_new ("(ss)", targetfile, sourcefile), G_DBUS_CALL_FLAGS_NONE=
, -1, NULL, error);
+-	if (proxy_ret !=3D NULL)
++	if (proxy_ret =3D=3D NULL)
+ 		return NULL;
+ 	ret =3D g_variant_ref_sink(proxy_ret);
+ 	g_variant_unref(proxy_ret);
+ 	return ret;
+-}
+\ No newline at end of file
++}
+--=20
+2.34.1
+
diff --git a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_g=
it.bb b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
new file mode 100644
index 000000000..22005632c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "Bluez Tools"
+DESCRIPTION =3D "\
+    Additional tools for bluez5 to list, manage, and show inforations abou=
t \
+    adapters, agents, devices, network connections, and obex. \
+"
+HOMEPAGE =3D "https://github.com/khvzak/bluez-tools"
+BUGTRACKER =3D "https://github.com/khvzak/bluez-tools/issues"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7=
e"
+
+DEPENDS =3D "dbus-glib glib-2.0 readline"
+
+SRC_URI =3D "\
+    git://github.com/khvzak/bluez-tools.git;protocol=3Dhttps;branch=3Dmast=
er \
+    file://fix-memory-leaks.patch \
+    file://obex-file-fix-null-check.patch \
+"
+SRCREV =3D "f65321736475429316f07ee94ec0deac8e46ec4a"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+RDEPENDS:${PN} =3D "bluez5"
--=20
2.34.1


