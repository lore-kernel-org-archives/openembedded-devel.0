Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB62C77B73
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 13:42:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8292.1685108524177712179
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 May 2023 06:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=ryhj/xM9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=451026ae70=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34QCTPlu006286
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 13:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=RlGu7xheQX4J7G+xfe9vRHnetJeYDZQCXH69HY+WXuo=;
 b=ryhj/xM9SnUe8xRA4ciUc3S+aR7yeofkOh7nyv2eTiCVNWNhcGN7MdgWnuTkUKbRnTuE
 SbdkmWLsWxzdMYJl8ehDVUlMYAozwQf+3sDpl9qHDIu1yE4G0Uji0uNMqfT6HIDBrQXv
 5qP9xs1wIZ0Evjqi9G1WPnJSkzVXI+5CzB/b4G7jVQnacggVq1ZVu3pP+qbrgCxgqaUg
 AOM8eVbe9QBg6FigoQOrrCzUICG//JUsaD6/9QJQvkJt0txZI7hsJN89A5B/d6ngDFnn
 D4tKE+29pYhLnpGPINw9/i7Pff6xnZ4aF5LaRrYc2ByGORTN/RlMxjeDcAp/J1linVOC Ng== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpkn1p99n-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 13:42:03 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 06:41:59 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-django: fix for CVE-2023-31047
Date: Fri, 26 May 2023 13:41:37 +0000
Message-ID: <20230526134137.1034723-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: BP3puSRnR4B1xPffklumTf1sxlEm1nQ6
X-Proofpoint-GUID: BP3puSRnR4B1xPffklumTf1sxlEm1nQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305260114
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34QCTPlu006286
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 13:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102871

From: Narpat Mali <narpat.mali@windriver.com>

In Django 3.2 before 3.2.19, 4.x before 4.1.9, and 4.2 before 4.2.1,
it was possible to bypass validation when using one form field to
upload multiple files. This multiple upload has never been supported
by forms.FileField or forms.ImageField (only the last uploaded file was
validated). However, Django's "Uploading multiple files" documentation
suggested otherwise.

Since, there is no ptest available for python3-django so have not tested
the patch changes at runtime.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-django/CVE-2023-31047.patch       | 352 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   2 +
 2 files changed, 354 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2023-31047.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2023-=
31047.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2023=
-31047.patch
new file mode 100644
index 0000000000..ab29a2ed97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-31047.p=
atch
@@ -0,0 +1,352 @@
+From fd3215dec5d50aa1f09cb1f8eba193524e7379f3 Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Thu, 25 May 2023 14:49:15 +0000
+Subject: [PATCH] Fixed CVE-2023-31047, Fixed #31710
+
+-- Prevented potential bypass of validation when uploading multiple file=
s using one form field.
+
+Thanks Moataz Al-Sharida and nawaik for reports.
+
+Co-authored-by: Shai Berger <shai@platonix.com>
+Co-authored-by: nessita <124304+nessita@users.noreply.github.com>
+
+CVE: CVE-2023-31047
+
+Upstream-Status: Backport [https://github.com/django/django/commit/fb4c5=
5d9ec4bb812a7fb91fa20510d91645e411b]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ django/forms/widgets.py                       | 26 ++++++-
+ docs/releases/2.2.28.txt                      | 18 +++++
+ docs/topics/http/file-uploads.txt             | 65 ++++++++++++++++--
+ .../forms_tests/field_tests/test_filefield.py | 68 ++++++++++++++++++-
+ .../widget_tests/test_clearablefileinput.py   |  5 ++
+ .../widget_tests/test_fileinput.py            | 44 ++++++++++++
+ 6 files changed, 218 insertions(+), 8 deletions(-)
+
+diff --git a/django/forms/widgets.py b/django/forms/widgets.py
+index e37036c..d0cc131 100644
+--- a/django/forms/widgets.py
++++ b/django/forms/widgets.py
+@@ -372,17 +372,41 @@ class MultipleHiddenInput(HiddenInput):
+
+
+ class FileInput(Input):
++    allow_multiple_selected =3D False
+     input_type =3D 'file'
+     needs_multipart_form =3D True
+     template_name =3D 'django/forms/widgets/file.html'
+
++    def __init__(self, attrs=3DNone):
++        if (
++            attrs is not None
++            and not self.allow_multiple_selected
++            and attrs.get("multiple", False)
++        ):
++            raise ValueError(
++                "%s doesn't support uploading multiple files."
++                % self.__class__.__qualname__
++            )
++        if self.allow_multiple_selected:
++            if attrs is None:
++                attrs =3D {"multiple": True}
++            else:
++                attrs.setdefault("multiple", True)
++        super().__init__(attrs)
++
+     def format_value(self, value):
+         """File input never renders a value."""
+         return
+
+     def value_from_datadict(self, data, files, name):
+         "File widgets take data from FILES, not POST"
+-        return files.get(name)
++        getter =3D files.get
++        if self.allow_multiple_selected:
++            try:
++                getter =3D files.getlist
++            except AttributeError:
++                pass
++        return getter(name)
+
+     def value_omitted_from_data(self, data, files, name):
+         return name not in files
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index 43270fc..854c6b0 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -20,3 +20,21 @@ CVE-2022-28347: Potential SQL injection via ``QuerySe=
t.explain(**options)`` on P
+ :meth:`.QuerySet.explain` method was subject to SQL injection in option=
 names,
+ using a suitably crafted dictionary, with dictionary expansion, as the
+ ``**options`` argument.
++
++Backporting the CVE-2023-31047 fix on Django 2.2.28.
++
++CVE-2023-31047: Potential bypass of validation when uploading multiple =
files using one form field
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++Uploading multiple files using one form field has never been supported =
by
++:class:`.forms.FileField` or :class:`.forms.ImageField` as only the las=
t
++uploaded file was validated. Unfortunately, :ref:`uploading_multiple_fi=
les`
++topic suggested otherwise.
++
++In order to avoid the vulnerability, :class:`~django.forms.ClearableFil=
eInput`
++and :class:`~django.forms.FileInput` form widgets now raise ``ValueErro=
r`` when
++the ``multiple`` HTML attribute is set on them. To prevent the exceptio=
n and
++keep the old behavior, set ``allow_multiple_selected`` to ``True``.
++
++For more details on using the new attribute and handling of multiple fi=
les
++through a single field, see :ref:`uploading_multiple_files`.
+diff --git a/docs/topics/http/file-uploads.txt b/docs/topics/http/file-u=
ploads.txt
+index 21a6f06..c1ffb80 100644
+--- a/docs/topics/http/file-uploads.txt
++++ b/docs/topics/http/file-uploads.txt
+@@ -127,19 +127,54 @@ field in the model::
+             form =3D UploadFileForm()
+         return render(request, 'upload.html', {'form': form})
+
++.. _uploading_multiple_files:
++
+ Uploading multiple files
+ ------------------------
+
+-If you want to upload multiple files using one form field, set the ``mu=
ltiple``
+-HTML attribute of field's widget:
++..
++    Tests in tests.forms_tests.field_tests.test_filefield.MultipleFileF=
ieldTest
++    should be updated after any changes in the following snippets.
++
++If you want to upload multiple files using one form field, create a sub=
class
++of the field's widget and set the ``allow_multiple_selected`` attribute=
 on it
++to ``True``.
++
++In order for such files to be all validated by your form (and have the =
value of
++the field include them all), you will also have to subclass ``FileField=
``. See
++below for an example.
++
++.. admonition:: Multiple file field
++
++    Django is likely to have a proper multiple file field support at so=
me point
++    in the future.
+
+ .. code-block:: python
+     :caption: forms.py
+
+     from django import forms
+
++
++    class MultipleFileInput(forms.ClearableFileInput):
++        allow_multiple_selected =3D True
++
++
++    class MultipleFileField(forms.FileField):
++        def __init__(self, *args, **kwargs):
++            kwargs.setdefault("widget", MultipleFileInput())
++            super().__init__(*args, **kwargs)
++
++        def clean(self, data, initial=3DNone):
++            single_file_clean =3D super().clean
++            if isinstance(data, (list, tuple)):
++                result =3D [single_file_clean(d, initial) for d in data=
]
++            else:
++                result =3D single_file_clean(data, initial)
++            return result
++
++
+     class FileFieldForm(forms.Form):
+-        file_field =3D forms.FileField(widget=3Dforms.ClearableFileInpu=
t(attrs=3D{'multiple': True}))
++        file_field =3D MultipleFileField()
+
+ Then override the ``post`` method of your
+ :class:`~django.views.generic.edit.FormView` subclass to handle multipl=
e file
+@@ -159,14 +194,32 @@ uploads:
+         def post(self, request, *args, **kwargs):
+             form_class =3D self.get_form_class()
+             form =3D self.get_form(form_class)
+-            files =3D request.FILES.getlist('file_field')
+             if form.is_valid():
+-                for f in files:
+-                    ...  # Do something with each file.
+                 return self.form_valid(form)
+             else:
+                 return self.form_invalid(form)
+
++        def form_valid(self, form):
++            files =3D form.cleaned_data["file_field"]
++            for f in files:
++                ...  # Do something with each file.
++            return super().form_valid()
++
++.. warning::
++
++   This will allow you to handle multiple files at the form level only.=
 Be
++   aware that you cannot use it to put multiple files on a single model
++   instance (in a single field), for example, even if the custom widget=
 is used
++   with a form field related to a model ``FileField``.
++
++.. backportedfix:: 2.2.28
++
++   In previous versions, there was no support for the ``allow_multiple_=
selected``
++   class attribute, and users were advised to create the widget with th=
e HTML
++   attribute ``multiple`` set through the ``attrs`` argument. However, =
this
++   caused validation of the form field to be applied only to the last f=
ile
++   submitted, which could have adverse security implications.
++
+ Upload Handlers
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+diff --git a/tests/forms_tests/field_tests/test_filefield.py b/tests/for=
ms_tests/field_tests/test_filefield.py
+index 3357444..ba559ee 100644
+--- a/tests/forms_tests/field_tests/test_filefield.py
++++ b/tests/forms_tests/field_tests/test_filefield.py
+@@ -1,7 +1,8 @@
+ import pickle
+
+ from django.core.files.uploadedfile import SimpleUploadedFile
+-from django.forms import FileField, ValidationError
++from django.core.validators import validate_image_file_extension
++from django.forms import FileField, FileInput, ValidationError
+ from django.test import SimpleTestCase
+
+
+@@ -82,3 +83,68 @@ class FileFieldTest(SimpleTestCase):
+
+     def test_file_picklable(self):
+         self.assertIsInstance(pickle.loads(pickle.dumps(FileField())), =
FileField)
++
++
++class MultipleFileInput(FileInput):
++    allow_multiple_selected =3D True
++
++
++class MultipleFileField(FileField):
++    def __init__(self, *args, **kwargs):
++        kwargs.setdefault("widget", MultipleFileInput())
++        super().__init__(*args, **kwargs)
++
++    def clean(self, data, initial=3DNone):
++        single_file_clean =3D super().clean
++        if isinstance(data, (list, tuple)):
++            result =3D [single_file_clean(d, initial) for d in data]
++        else:
++            result =3D single_file_clean(data, initial)
++        return result
++
++
++class MultipleFileFieldTest(SimpleTestCase):
++    def test_file_multiple(self):
++        f =3D MultipleFileField()
++        files =3D [
++            SimpleUploadedFile("name1", b"Content 1"),
++            SimpleUploadedFile("name2", b"Content 2"),
++        ]
++        self.assertEqual(f.clean(files), files)
++
++    def test_file_multiple_empty(self):
++        f =3D MultipleFileField()
++        files =3D [
++            SimpleUploadedFile("empty", b""),
++            SimpleUploadedFile("nonempty", b"Some Content"),
++        ]
++        msg =3D "'The submitted file is empty.'"
++        with self.assertRaisesMessage(ValidationError, msg):
++            f.clean(files)
++        with self.assertRaisesMessage(ValidationError, msg):
++            f.clean(files[::-1])
++
++    def test_file_multiple_validation(self):
++        f =3D MultipleFileField(validators=3D[validate_image_file_exten=
sion])
++
++        good_files =3D [
++            SimpleUploadedFile("image1.jpg", b"fake JPEG"),
++            SimpleUploadedFile("image2.png", b"faux image"),
++            SimpleUploadedFile("image3.bmp", b"fraudulent bitmap"),
++        ]
++        self.assertEqual(f.clean(good_files), good_files)
++
++        evil_files =3D [
++            SimpleUploadedFile("image1.sh", b"#!/bin/bash -c 'echo pwne=
d!'\n"),
++            SimpleUploadedFile("image2.png", b"faux image"),
++            SimpleUploadedFile("image3.jpg", b"fake JPEG"),
++        ]
++
++        evil_rotations =3D (
++            evil_files[i:] + evil_files[:i]  # Rotate by i.
++            for i in range(len(evil_files))
++        )
++        msg =3D "File extension =E2=80=9Csh=E2=80=9D is not allowed. Al=
lowed extensions are: "
++        for rotated_evil_files in evil_rotations:
++            with self.assertRaisesMessage(ValidationError, msg):
++                f.clean(rotated_evil_files)
+diff --git a/tests/forms_tests/widget_tests/test_clearablefileinput.py b=
/tests/forms_tests/widget_tests/test_clearablefileinput.py
+index 2ba376d..8d9e38a 100644
+--- a/tests/forms_tests/widget_tests/test_clearablefileinput.py
++++ b/tests/forms_tests/widget_tests/test_clearablefileinput.py
+@@ -161,3 +161,8 @@ class ClearableFileInputTest(WidgetTest):
+         self.assertIs(widget.value_omitted_from_data({}, {}, 'field'), =
True)
+         self.assertIs(widget.value_omitted_from_data({}, {'field': 'x'}=
, 'field'), False)
+         self.assertIs(widget.value_omitted_from_data({'field-clear': 'y=
'}, {}, 'field'), False)
++
++    def test_multiple_error(self):
++        msg =3D "ClearableFileInput doesn't support uploading multiple =
files."
++        with self.assertRaisesMessage(ValueError, msg):
++            ClearableFileInput(attrs=3D{"multiple": True})
+diff --git a/tests/forms_tests/widget_tests/test_fileinput.py b/tests/fo=
rms_tests/widget_tests/test_fileinput.py
+index bbd7c7f..24daf5d 100644
+--- a/tests/forms_tests/widget_tests/test_fileinput.py
++++ b/tests/forms_tests/widget_tests/test_fileinput.py
+@@ -1,4 +1,6 @@
++from django.core.files.uploadedfile import SimpleUploadedFile
+ from django.forms import FileInput
++from django.utils.datastructures import MultiValueDict
+
+ from .base import WidgetTest
+
+@@ -18,3 +20,45 @@ class FileInputTest(WidgetTest):
+     def test_value_omitted_from_data(self):
+         self.assertIs(self.widget.value_omitted_from_data({}, {}, 'fiel=
d'), True)
+         self.assertIs(self.widget.value_omitted_from_data({}, {'field':=
 'value'}, 'field'), False)
++
++    def test_multiple_error(self):
++        msg =3D "FileInput doesn't support uploading multiple files."
++        with self.assertRaisesMessage(ValueError, msg):
++            FileInput(attrs=3D{"multiple": True})
++
++    def test_value_from_datadict_multiple(self):
++        class MultipleFileInput(FileInput):
++            allow_multiple_selected =3D True
++
++        file_1 =3D SimpleUploadedFile("something1.txt", b"content 1")
++        file_2 =3D SimpleUploadedFile("something2.txt", b"content 2")
++        # Uploading multiple files is allowed.
++        widget =3D MultipleFileInput(attrs=3D{"multiple": True})
++        value =3D widget.value_from_datadict(
++            data=3D{"name": "Test name"},
++            files=3DMultiValueDict({"myfile": [file_1, file_2]}),
++            name=3D"myfile",
++        )
++        self.assertEqual(value, [file_1, file_2])
++        # Uploading multiple files is not allowed.
++        widget =3D FileInput()
++        value =3D widget.value_from_datadict(
++            data=3D{"name": "Test name"},
++            files=3DMultiValueDict({"myfile": [file_1, file_2]}),
++            name=3D"myfile",
++        )
++        self.assertEqual(value, file_2)
++
++    def test_multiple_default(self):
++        class MultipleFileInput(FileInput):
++            allow_multiple_selected =3D True
++
++        tests =3D [
++            (None, True),
++            ({"class": "myclass"}, True),
++            ({"multiple": False}, False),
++        ]
++        for attrs, expected in tests:
++            with self.subTest(attrs=3Dattrs):
++                widget =3D MultipleFileInput(attrs=3Dattrs)
++                self.assertIs(widget.attrs["multiple"], expected)
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=
 b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 9ef988176e..77a1a2a740 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -5,6 +5,8 @@ UPSTREAM_CHECK_REGEX =3D "/${PYPI_PACKAGE}/(?P<pver>(2\.2=
\.\d*)+)/"
=20
 inherit setuptools3
=20
+SRC_URI +=3D "file://CVE-2023-31047.patch"
+
 SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951e52ac=
d51f6abda33a7413"
=20
 RDEPENDS:${PN} +=3D "\
--=20
2.40.0


